import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TalkerLoggerUtil {
  factory TalkerLoggerUtil() => _instance;

  TalkerLoggerUtil._internal();

  static final TalkerLoggerUtil _instance = TalkerLoggerUtil._internal();

  static final Talker talker = TalkerFlutter.init(
    logger: TalkerLogger(
      formatter: ShortStackTraceFormatter(enableBorders: !Platform.isAndroid),
    ),
    settings: TalkerSettings(
      useConsoleLogs: !(const bool.fromEnvironment(
        'dart.vm.product',
        defaultValue: true,
      )),
      colors: {TalkerKey.verbose: AnsiPen()..yellow()},
    ),
  );

  static const theme = TalkerScreenTheme(
    backgroundColor: Color(0xFFF7F8FA),
    textColor: Color(0xFF1F2933),
    cardColor: Color(0xFFFFFFFF),
    logColors: {
      TalkerKey.error: Color(0xFFE04848),
      TalkerKey.critical: Color(0xFFB91C1C),
      TalkerKey.info: Color(0xFF2563EB),
      TalkerKey.debug: Color(0xFF64748B),
      TalkerKey.verbose: Color(0xFF94A3B8),
      TalkerKey.warning: Color(0xFFF59E0B),
      TalkerKey.exception: Color(0xFFE04848),
      TalkerKey.httpError: Color(0xFFE04848),
      TalkerKey.httpRequest: Color(0xFF0EA5E9),
      TalkerKey.httpResponse: Color(0xFF16A34A),
      TalkerKey.blocEvent: Color(0xFF0F766E),
      TalkerKey.blocTransition: Color(0xFF22C55E),
      TalkerKey.blocClose: Color(0xFFFB7185),
      TalkerKey.blocCreate: Color(0xFF65A30D),
      TalkerKey.route: Color(0xFF0284C7),
    },
  );
}

extension TalkerFlutter on Talker {
  static Talker init({
    TalkerLogger? logger,
    TalkerObserver? observer,
    TalkerSettings? settings,
    TalkerFilter? filter,
  }) => Talker(
    logger: (logger ?? TalkerLogger()).copyWith(
      output: _defaultFlutterOutput,
      settings: TalkerLoggerSettings(maxLineWidth: 120),
    ),
    settings: settings,
    observer: observer,
    filter: filter,
  );

  static dynamic _defaultFlutterOutput(String message) {
    if (kIsWeb) {
      // ignore: avoid_print
      print(message);
      return;
    }
    if ([
      TargetPlatform.iOS,
      TargetPlatform.macOS,
    ].contains(defaultTargetPlatform)) {
      log(message, name: 'project');
      return;
    }
    debugPrint(message);
  }
}

class ShortStackTraceFormatter implements LoggerFormatter {
  const ShortStackTraceFormatter({
    this.maxStackLines = 15,
    this.enableBorders = true,
  });

  final int maxStackLines;
  final bool enableBorders;

  @override
  String fmt(LogDetails details, TalkerLoggerSettings settings) {
    final msg = details.message?.toString() ?? '';
    String formattedMsg = msg;

    if (details.level == LogLevel.error || details.level == LogLevel.critical) {
      final stackIndex = msg.indexOf('StackTrace:');
      if (stackIndex != -1) {
        final prefix = msg.substring(0, stackIndex);
        final stackPart = msg.substring(stackIndex);

        final stackLines = stackPart.split('\n');

        if (stackLines.length > maxStackLines) {
          final trimmedStackLines = [
            ...stackLines.take(maxStackLines),
            '... (${stackLines.length - maxStackLines} more frames)',
          ];
          formattedMsg = prefix + trimmedStackLines.join('\n');
        }
      }
    }

    if (!enableBorders) {
      if (!settings.enableColors) {
        return formattedMsg;
      }
      return formattedMsg
          .split('\n')
          .map((e) => details.pen.write(e))
          .join('\n');
    }

    final underline = ConsoleUtils.getUnderline(
      settings.maxLineWidth,
      lineSymbol: settings.lineSymbol,
      withCorner: true,
    );
    final topline = ConsoleUtils.getTopline(
      settings.maxLineWidth,
      lineSymbol: settings.lineSymbol,
      withCorner: true,
    );

    final msgBorderedLines = formattedMsg.split('\n').map((e) => '| $e');

    if (!settings.enableColors) {
      return '$topline\n${msgBorderedLines.join('\n')}\n$underline';
    }

    var lines = [topline, ...msgBorderedLines, underline];
    lines = lines.map((e) => details.pen.write(e)).toList();
    return lines.join('\n');
  }
}
