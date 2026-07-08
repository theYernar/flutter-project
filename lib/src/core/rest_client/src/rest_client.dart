import 'dart:typed_data';

/// A REST client for making HTTP requests.
abstract interface class IRestClient {
  Future<Map<String, Object?>> get(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  });

  Future<Map<String, Object?>> post(
    String path, {
    required Object? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  });

  Future<Map<String, Object?>> put(
    String path, {
    required Object? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  });

  Future<Map<String, Object?>> delete(
    String path, {
    Map<String, Object?>? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  });

  Future<Map<String, Object?>> patch(
    String path, {
    required Map<String, Object?> body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    bool returnFullData = false,
  });

  Future<Uint8List> getBytes(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  });
}
