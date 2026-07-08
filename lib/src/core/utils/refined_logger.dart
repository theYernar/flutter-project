import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

/// Logger global instance.
RefinedLogger get logger =>
    Zone.current[_loggerKey] as RefinedLogger? ?? _logger;

void runWithLogger<T>(RefinedLogger logger, T Function() callback) {
  runZoned(callback, zoneValues: {_loggerKey: logger});
}

const _loggerKey = 'logger';

final _logger = DefaultLogger();

typedef LogFormatter =
    String Function(LogWrapper wrappedMessage, LoggingOptions options);

class LoggingOptions {
  const LoggingOptions({
    this.level = LogLevel.info,
    this.showTime = true,
    this.showEmoji = true,
    this.logInRelease = false,
    this.useDebugPrint = false,
    this.formatter,
  });

  final bool showTime;
  final bool showEmoji;
  final bool logInRelease;
  final LogLevel level;
  final bool useDebugPrint;
  final LogFormatter? formatter;
}

class LogWrapper {
  LogWrapper({
    required this.message,
    required this.printStackTrace,
    required this.printError,
  });

  LogMessage message;
  bool printStackTrace;
  bool printError;
}

class DefaultLogger extends RefinedLogger {
  DefaultLogger([LoggingOptions options = const LoggingOptions()]) {
    _init(options);
  }

  final _controller = StreamController<LogWrapper>();
  late final _logWrapStream = _controller.stream.asBroadcastStream();
  late final _logStream = _logWrapStream.map((wrapper) => wrapper.message);
  bool _destroyed = false;

  void _init(LoggingOptions options) {
    if (kReleaseMode && !options.logInRelease) {
      return;
    }
    _logWrapStream.listen((l) => _printLogMessage(l, options));
  }

  @override
  Stream<LogMessage> get logs => _logStream;

  @override
  void destroy() {
    _controller.close();
    _destroyed = true;
  }

  @override
  void log(
    String message, {
    required LogLevel level,
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? context,
    bool printStackTrace = true,
    bool printError = true,
  }) {
    if (_destroyed) {
      _log('Logger has been destroyed. It cannot be used anymore.');
      return;
    }

    final logMessage = LogWrapper(
      message: LogMessage(
        message: message,
        level: level,
        timestamp: clock.now(),
        error: error,
        stackTrace: stackTrace,
        context: context,
      ),
      printStackTrace: printStackTrace,
      printError: printError,
    );

    _controller.add(logMessage);
  }

  void _printLogMessage(LogWrapper wrappedMessage, LoggingOptions options) {
    if (_destroyed) {
      _log('Logger has been destroyed. It cannot be used anymore.');
      return;
    }

    final formattedMessage = options.formatter != null
        ? options.formatter!(wrappedMessage, options)
        : _defaultFormatter(wrappedMessage, options);

    _log(formattedMessage);
  }

  String _defaultFormatter(LogWrapper wrappedMessage, LoggingOptions options) {
    final message = wrappedMessage.message;
    final time = options.showTime ? message.timestamp.toIso8601String() : '';
    final emoji = options.showEmoji ? message.level.emoji : '';
    final level = message.level;
    final content = message.message;
    final stackTrace = message.stackTrace;
    final error = message.error;

    final buffer = StringBuffer();

    buffer.write('$emoji $time [${level.name.toUpperCase()}] $content');

    if (error != null && wrappedMessage.printError) {
      buffer.writeln();
      buffer.write(error);
    }

    if (stackTrace != null && wrappedMessage.printStackTrace) {
      buffer.writeln();
      buffer.write(Trace.from(stackTrace).terse);
    }

    return buffer.toString();
  }

  void _log(String message, {bool useDebugPrint = false}) {
    if (useDebugPrint) {
      debugPrint(message);
    } else {
      Zone.current.print(message);
    }
  }
}

abstract class RefinedLogger {
  Stream<LogMessage> get logs;

  void destroy();

  void log(
    String message, {
    required LogLevel level,
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? context,
    bool printStackTrace = true,
    bool printError = true,
  });

  void logZoneError(Object error, StackTrace stackTrace) => log(
    'Zone error',
    level: LogLevel.error,
    error: error,
    stackTrace: stackTrace,
  );

  void logFlutterError(FlutterErrorDetails details) => log(
    details.toString(),
    level: LogLevel.error,
    error: details.exception,
    stackTrace: details.stack,
    printStackTrace: false,
    printError: false,
  );

  bool logPlatformDispatcherError(Object error, StackTrace stackTrace) {
    log(
      'Platform dispatcher error',
      level: LogLevel.error,
      error: error,
      stackTrace: stackTrace,
    );
    return true;
  }

  void trace(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? context,
    bool printStackTrace = true,
    bool printError = true,
  }) => log(
    message,
    level: LogLevel.trace,
    error: error,
    stackTrace: stackTrace,
    context: context,
    printStackTrace: printStackTrace,
    printError: printError,
  );

  void debug(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? context,
    bool printStackTrace = true,
    bool printError = true,
  }) => log(
    message,
    level: LogLevel.debug,
    error: error,
    stackTrace: stackTrace,
    context: context,
    printStackTrace: printStackTrace,
    printError: printError,
  );

  void info(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? context,
    bool printStackTrace = true,
    bool printError = true,
  }) => log(
    message,
    level: LogLevel.info,
    error: error,
    stackTrace: stackTrace,
    context: context,
    printStackTrace: printStackTrace,
    printError: printError,
  );

  void warn(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? context,
    bool printStackTrace = true,
    bool printError = true,
  }) => log(
    message,
    level: LogLevel.warn,
    error: error,
    stackTrace: stackTrace,
    context: context,
    printStackTrace: printStackTrace,
    printError: printError,
  );

  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? context,
    bool printStackTrace = true,
    bool printError = true,
  }) => log(
    message,
    level: LogLevel.error,
    error: error,
    stackTrace: stackTrace,
    context: context,
    printStackTrace: printStackTrace,
    printError: printError,
  );

  void fatal(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, Object?>? context,
    bool printStackTrace = true,
    bool printError = true,
  }) => log(
    message,
    level: LogLevel.fatal,
    error: error,
    stackTrace: stackTrace,
    context: context,
    printStackTrace: printStackTrace,
    printError: printError,
  );
}

class LogMessage {
  const LogMessage({
    required this.message,
    required this.level,
    required this.timestamp,
    this.error,
    this.stackTrace,
    this.context,
  });

  final String message;
  final LogLevel level;
  final DateTime timestamp;
  final Object? error;
  final StackTrace? stackTrace;
  final Map<String, Object?>? context;
}

enum LogLevel implements Comparable<LogLevel> {
  trace._(0),
  debug._(1),
  info._(2),
  warn._(3),
  error._(4),
  fatal._(5);

  const LogLevel._(this.severity);

  final int severity;

  @override
  int compareTo(LogLevel other) => severity.compareTo(other.severity);
}

extension on LogLevel {
  String get emoji => const {
    LogLevel.trace: 'T',
    LogLevel.debug: 'D',
    LogLevel.info: 'I',
    LogLevel.warn: 'W',
    LogLevel.error: 'E',
    LogLevel.fatal: 'F',
  }[this]!;
}
