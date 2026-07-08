import 'package:clock/clock.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:project/src/core/constant/config.dart';
import 'package:project/src/core/utils/refined_logger.dart';
import 'package:project/src/feature/app/initialization/model/dependencies_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Builds the dependency graph once at app startup.
///
/// Use `compose()` from `AppRunner` and pass the result into the widget tree
/// via `DependenciesScope`.
final class CompositionRoot {
  const CompositionRoot(this.config, this.logger);

  final Config config;
  final RefinedLogger logger;

  Future<CompositionResult> compose() async {
    final stopwatch = clock.stopwatch()..start();

    logger.info('Initializing dependencies...');
    final dependencies = await DependenciesFactory(config, logger).create();
    logger.info('Dependencies initialized');

    stopwatch.stop();
    return CompositionResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
  }
}

abstract class Factory<T> {
  T create();
}

abstract class AsyncFactory<T> {
  Future<T> create();
}

class DependenciesFactory extends AsyncFactory<DependenciesContainer> {
  DependenciesFactory(this.config, this.logger);

  final Config config;
  final RefinedLogger logger;

  @override
  Future<DependenciesContainer> create() async {
    final sharedPreferences = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    );
    final packageInfo = await PackageInfo.fromPlatform();

    return DependenciesContainer(
      packageInfo: packageInfo,
      sharedPreferences: sharedPreferences,
    );
  }
}

final class CompositionResult {
  const CompositionResult({required this.dependencies, required this.msSpent});

  final DependenciesContainer dependencies;
  final int msSpent;

  @override
  String toString() =>
      'CompositionResult(dependencies: $dependencies, msSpent: $msSpent)';
}
