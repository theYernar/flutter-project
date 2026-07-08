import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract base class RestClientException extends Equatable implements Exception {
  const RestClientException({
    required this.message,
    this.statusCode,
    required this.cause,
    this.reset = false,
  });

  final String message;
  final int? statusCode;
  final Object? cause;
  final bool reset;
}

abstract base class RestClientExceptionWithCause extends RestClientException {
  const RestClientExceptionWithCause({
    required super.message,
    super.cause,
    super.statusCode,
    super.reset = false,
  });
}

final class ClientException extends RestClientException {
  const ClientException({
    required super.message,
    super.statusCode,
    super.cause,
    super.reset = false,
  });

  @override
  String toString() =>
      'ClientException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause, '
      'reset: $reset'
      ')';

  @override
  List<Object?> get props => [message, statusCode, cause];
}

/// Raised by the rest client when the response contains a structured 'error'
/// field. Repositories should catch this and re-throw domain-level exceptions.
final class CustomBackendException extends RestClientException {
  const CustomBackendException({
    required super.message,
    super.statusCode,
    super.reset = false,
    super.cause,
  });

  @override
  String toString() =>
      'CustomBackendException('
      'message: $message, '
      'cause: $cause, '
      'statusCode: $statusCode'
      ')';

  @override
  List<Object?> get props => [message, cause, statusCode];
}

final class WrongResponseTypeException extends RestClientException {
  const WrongResponseTypeException({
    required super.message,
    super.cause,
    super.statusCode,
    super.reset = false,
  });

  @override
  String toString() =>
      'WrongResponseTypeException('
      'message: $message, '
      'statusCode: $statusCode, '
      'reset: $reset'
      ')';

  @override
  List<Object?> get props => [message, statusCode, reset];

  WrongResponseTypeException copyWith({
    int? statusCode,
    String? message,
    bool? reset,
  }) => WrongResponseTypeException(
    message: message ?? this.message,
    statusCode: statusCode ?? this.statusCode,
    reset: reset ?? this.reset,
  );
}

final class ConnectionException extends RestClientExceptionWithCause {
  const ConnectionException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() =>
      'ConnectionException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause, '
      'reset: $reset'
      ')';

  @override
  List<Object?> get props => [message, statusCode, cause, reset];
}

final class InternalServerException extends RestClientExceptionWithCause {
  const InternalServerException({
    required super.message,
    super.statusCode,
    super.cause,
  });

  @override
  String toString() =>
      'InternalServerException('
      'message: $message, '
      'statusCode: $statusCode, '
      'cause: $cause, '
      'reset: $reset'
      ')';

  @override
  List<Object?> get props => [message, statusCode, cause, reset];
}
