import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/src/core/constant/config.dart';
import 'package:flutter_project/src/core/utils/app_bloc_observer.dart';
import 'package:flutter_project/src/core/utils/refined_logger.dart';
import 'package:flutter_project/src/core/utils/talker_logger_util.dart';
import 'package:flutter_project/src/feature/app/bloc/app_restart_bloc.dart';
import 'package:flutter_project/src/feature/app/initialization/logic/composition_root.dart';
import 'package:flutter_project/src/feature/app/initialization/widget/initialization_failed_app.dart';
import 'package:flutter_project/src/feature/app/presentation/app.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

/// Boots the app: sets up logging, error hooks, the bloc observer, runs
/// `CompositionRoot` and finally `runApp(App(...))`. Falls back to
/// `InitializationFailedApp` on bootstrap errors.
final class AppRunner {
  const AppRunner();

  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    binding.deferFirstFrame();

    FlutterError.onError = logger.logFlutterError;
    WidgetsBinding.instance.platformDispatcher.onError =
        logger.logPlatformDispatcherError;

    if (kDebugMode) {
      Bloc.observer = TalkerBlocObserver(
        talker: TalkerLoggerUtil.talker,
        settings: const TalkerBlocLoggerSettings(
          printStateFullData: false,
          printEventFullData: false,
        ),
      );
    } else {
      Bloc.observer = AppBlocObserver(logger);
    }

    Bloc.transformer = bloc_concurrency.sequential();

    const config = Config();

    Future<void> run() async {
      try {
        final result = await CompositionRoot(config, logger).compose();
        TalkerLoggerUtil.talker.log('Composition done in ${result.msSpent} ms');

        runApp(
          BlocProvider(
            create: (_) => AppRestartBloc(),
            child: App(result: result),
          ),
        );
      } catch (e, stackTrace) {
        TalkerLoggerUtil.talker.error('Initialization failed', e, stackTrace);
        logger.error('Initialization failed', error: e, stackTrace: stackTrace);
        runApp(
          InitializationFailedApp(
            error: e,
            stackTrace: stackTrace,
            onRetryInitialization: run,
          ),
        );
        rethrow;
      } finally {
        if (!binding.firstFrameRasterized) binding.allowFirstFrame();
      }
    }

    await run();
  }
}
