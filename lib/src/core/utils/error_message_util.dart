import 'package:flutter_project/src/core/rest_client/rest_client.dart';

String errorMessageOf(Object error) {
  if (error is RestClientException) {
    final message = error.message.trim();
    if (message.isNotEmpty) return message;

    final cause = error.cause;
    if (cause is Map) {
      final causeMessage = cause['message'];
      if (causeMessage is String && causeMessage.trim().isNotEmpty) {
        return causeMessage.trim();
      }
    }
  }

  return error.toString();
}
