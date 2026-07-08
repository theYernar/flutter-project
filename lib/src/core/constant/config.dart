import 'package:project/src/feature/app/initialization/model/environment.dart';

/// Application configuration.
class Config {
  const Config();

  // TODO(security): Replace the fallback with an HTTPS host and fail fast in prod if it is not HTTPS.
  static const String _projectApiBaseUrl = 'http://89.207.250.228:8009';

  /// The current environment.
  Environment get environment {
    var environment = const String.fromEnvironment('ENVIRONMENT');

    if (environment.isNotEmpty) {
      return Environment.from(environment);
    }

    environment = const String.fromEnvironment('FLUTTER_APP_FLAVOR');

    return Environment.from(environment);
  }

  /// API base URL.
  ///
  /// `API_BASE_URL` has priority for local overrides. Until separate backend
  /// hosts are provided, every environment falls back to the current project API.
  String get apiBaseUrl {
    const override = String.fromEnvironment('API_BASE_URL');
    if (override.isNotEmpty) return override;

    return switch (environment) {
      Environment.dev ||
      Environment.staging ||
      Environment.prod => _projectApiBaseUrl,
    };
  }
}
