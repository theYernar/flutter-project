import 'package:dio/dio.dart';
import 'package:project/src/core/utils/talker_logger_util.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

/// Thin wrapper around [Dio] that wires up base headers, auth header (later),
/// and Talker-based request/response logging.
class DioClient {
  factory DioClient({
    required String baseUrl,
    required Interceptor interceptor,
    required PackageInfo packageInfo,
    String? Function()? getAccessToken,
    String Function()? getLanguageCode,
    Dio? initialDio,
    bool useInterceptorWrapper = true,
  }) => DioClient._internal(
    baseUrl: baseUrl,
    initialDio: initialDio,
    interceptor: interceptor,
    packageInfo: packageInfo,
    getAccessToken: getAccessToken,
    getLanguageCode: getLanguageCode,
    useInterceptorWrapper: useInterceptorWrapper,
  );

  DioClient._internal({
    required String baseUrl,
    required Interceptor interceptor,
    required PackageInfo packageInfo,
    required String? Function()? getAccessToken,
    required String Function()? getLanguageCode,
    required Dio? initialDio,
    required bool useInterceptorWrapper,
  }) : dio = initialDio ?? Dio(BaseOptions(baseUrl: baseUrl)) {
    _initInterceptors(
      dioInterceptor: interceptor,
      packageInfo: packageInfo,
      getAccessToken: getAccessToken,
      getLanguageCode: getLanguageCode,
      useInterceptorWrapper: useInterceptorWrapper,
    );
  }

  final Dio dio;

  void _initInterceptors({
    required Interceptor dioInterceptor,
    required PackageInfo packageInfo,
    required String? Function()? getAccessToken,
    required String Function()? getLanguageCode,
    required bool useInterceptorWrapper,
  }) {
    if (useInterceptorWrapper) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Accept'] = 'application/json';
            options.headers['version'] = packageInfo.version;
            if (getLanguageCode != null) {
              options.headers['Accept-Language'] = getLanguageCode();
            }
            final token = getAccessToken?.call();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            return handler.next(options);
          },
          onError: (e, handler) => handler.next(e),
        ),
      );
    }

    dio.interceptors.add(
      TalkerDioLogger(
        talker: TalkerLoggerUtil.talker,
        // TODO(security): Disable header logging in release or redact Authorization before logging.
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ),
    );

    dio.interceptors.add(dioInterceptor);
  }
}
