import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Container of composed dependencies built once at app startup by
/// `CompositionRoot`. Features should read from this container via
/// `DependenciesScope.of(context)` and not instantiate dependencies themselves.
base class DependenciesContainer {
  const DependenciesContainer({
    required this.packageInfo,
    required this.sharedPreferences,
  });

  final PackageInfo packageInfo;
  final SharedPreferencesWithCache sharedPreferences;
}

/// Used by widget tests: subclass and override only the dependencies your
/// test touches.
base class TestDependenciesContainer implements DependenciesContainer {
  @override
  Object? noSuchMethod(Invocation invocation) {
    throw UnimplementedError(
      'The test tries to access ${invocation.memberName} dependency, but '
      'it was not provided. Please provide the dependency in the test.',
    );
  }
}
