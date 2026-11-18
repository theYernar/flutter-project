import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter_project/src/core/rest_client/rest_client.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

@immutable
abstract base class RestClientBase implements IRestClient {
  RestClientBase({required String baseUrl}) : baseUri = Uri.parse(baseUrl);

  final Uri baseUri;

  static final _jsonUTF8 = json.fuse(utf8);

  Future<Map<String, Object?>> send({
    required String path,
    required String method,
    Object? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    required bool returnFullData,
  });

  @override
  Future<Map<String, Object?>> delete(
    String path, {
    Map<String, Object?>? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  }) => send(
    path: path,
    method: 'DELETE',
    headers: headers,
    queryParams: queryParams,
    returnFullData: returnFullData,
  );

  @override
  Future<Map<String, Object?>> get(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  }) => send(
    path: path,
    method: 'GET',
    headers: headers,
    queryParams: queryParams,
    returnFullData: returnFullData,
  );

  @override
  Future<Map<String, Object?>> patch(
    String path, {
    required Map<String, Object?> body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  }) => send(
    path: path,
    method: 'PATCH',
    body: body,
    headers: headers,
    queryParams: queryParams,
    returnFullData: returnFullData,
  );

  @override
  Future<Map<String, Object?>> post(
    String path, {
    required Object? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  }) => send(
    path: path,
    method: 'POST',
    body: body,
    headers: headers,
    queryParams: queryParams,
    returnFullData: returnFullData,
  );

  @override
  Future<Map<String, Object?>> put(
    String path, {
    required Object? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  }) => send(
    path: path,
    method: 'PUT',
    body: body,
    headers: headers,
    queryParams: queryParams,
    returnFullData: returnFullData,
  );

  @override
  Future<Uint8List> getBytes(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  });

  @protected
  @visibleForTesting
  List<int> encodeBody(Object? body) {
    try {
      return _jsonUTF8.encode(body);
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(
        ClientException(message: 'Error occurred during encoding', cause: e),
        stackTrace,
      );
    }
  }

  @protected
  @visibleForTesting
  Uri buildUri({required String path, Map<String, Object?>? queryParams}) {
    final finalPath = p.join(baseUri.path, path);
    return baseUri.replace(
      path: finalPath,
      queryParameters: {...baseUri.queryParameters, ...?queryParams},
    );
  }

  /// Decodes the response body and unwraps `{ "data": ... }` or `{ "error": ... }`.
  @protected
  @visibleForTesting
  Future<Map<String, Object?>?> decodeResponse(
    Object? body, {
    int? statusCode,
    bool returnFullData = false,
  }) async {
    if (body == null) return null;

    assert(
      body is String || body is Map<String, Object?> || body is List,
      'Unexpected response body type: ${body.runtimeType}',
    );

    try {
      final decodedBody = switch (body) {
        final Map<String, Object?> map => map,
        final String str =>
          str.contains('html') ? {'HTML error': str} : await _decodeString(str),
        final List<int> bytes => await _decodeBytes(bytes),
        final List<dynamic> list => {'data': list.cast<Map<String, dynamic>>()},
        _ => throw WrongResponseTypeException(
          message: 'Unexpected response: ${body.runtimeType}',
          statusCode: statusCode,
        ),
      };

      if (returnFullData) {
        return decodedBody;
      }

      if (decodedBody case {'error': final Map<String, Object?> error}) {
        throw CustomBackendException(
          cause: error,
          statusCode: statusCode,
          message: '',
        );
      }

      if (decodedBody case {'data': final Map<String, Object?> data}) {
        return data;
      } else if (decodedBody case {'data': final List<dynamic> data}) {
        return {'data': data.cast<Map<String, dynamic>>()};
      }

      return decodedBody;
    } on RestClientException {
      rethrow;
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(
        ClientException(
          message: 'Error occurred during decoding',
          statusCode: statusCode,
          cause: e,
        ),
        stackTrace,
      );
    }
  }

  Future<Map<String, Object?>?> _decodeString(String str) async {
    if (str.isEmpty) return null;
    if (str.length > 1000) {
      return Isolate.run(() => json.decode(str) as Map<String, Object?>);
    }
    return json.decode(str) as Map<String, Object?>;
  }

  Future<Map<String, Object?>?> _decodeBytes(List<int> bytes) async {
    if (bytes.isEmpty) return null;
    if (bytes.length > 1000) {
      return Isolate.run(
        () => _jsonUTF8.decode(bytes)! as Map<String, Object?>,
      );
    }
    return _jsonUTF8.decode(bytes)! as Map<String, Object?>;
  }
}
