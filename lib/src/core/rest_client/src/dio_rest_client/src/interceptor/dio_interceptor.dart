import 'dart:io';

import 'package:dio/dio.dart';
import 'package:project/src/core/utils/talker_logger_util.dart';

/// Translates Dio errors into human-readable messages and rejects them
/// further down the chain.
class DioInterceptor extends Interceptor {
  const DioInterceptor({this.onUnauthorized});

  final void Function()? onUnauthorized;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final errorMessage = _parseDioError(err);

    if ((err.response?.statusCode ?? 0) == HttpStatus.unauthorized) {
      onUnauthorized?.call();
    }

    return handler.reject(
      DioException(
        error: err,
        message: errorMessage,
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
      ),
    );
  }

  String _parseDioError(DioException error) {
    switch (error.response?.statusCode) {
      case HttpStatus.unauthorized:
        try {
          return ((error.response?.data as Map<String, dynamic>)['message']
                  as String?) ??
              'Not authorized. Please log in again!';
        } catch (e) {
          TalkerLoggerUtil.talker.error('Not authorized: $e');
          return 'Not authorized. Please log in again!';
        }
      case HttpStatus.notFound:
        return 'The content you are looking for has not been found!';
      case HttpStatus.requestEntityTooLarge:
        return 'Request Entity Too Large';
      case HttpStatus.internalServerError:
        try {
          return ((error.response?.data as Map<String, dynamic>)['message']
                  as String?) ??
              'Unknown error[500]';
        } catch (e) {
          TalkerLoggerUtil.talker.error('Server error: $e');
          return 'Something is wrong with our servers, the problem will be solved soon!';
        }
      default:
        try {
          return ((error.response?.data as Map<String, dynamic>?)?['message']
                  as String?) ??
              'Unknown error[${error.response?.statusCode}]';
        } catch (e) {
          TalkerLoggerUtil.talker.error(
            'HTTP NetworkException: $e | Status: ${error.response?.statusCode} | Type: ${error.type.name}',
          );
          return error.response?.statusCode != null
              ? 'HTTP (${error.response?.statusCode}) ${error.type.name}'
              : 'NetworkException: ${error.type.name}';
        }
    }
  }
}
