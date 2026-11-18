import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_project/src/core/rest_client/rest_client.dart';
import 'package:flutter_project/src/core/rest_client/src/dio_rest_client/src/interceptor/dio_interceptor.dart';
import 'package:flutter_project/src/feature/auth/data/auth_remote_ds.dart';
import 'package:flutter_project/src/feature/auth/data/auth_repository.dart';
import 'package:flutter_project/src/feature/auth/database/auth_dao.dart';
import 'package:flutter_project/src/feature/home/data/home_remote_ds.dart';
import 'package:flutter_project/src/feature/home/data/home_repository.dart';
import 'package:flutter_project/src/feature/profile/data/profile_remote_ds.dart';
import 'package:flutter_project/src/feature/profile/data/profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Storage of repositories, data sources and DAOs.
///
/// Feature-specific entries (auth, profile, ...) will be added here as the
/// app grows. Each getter is lazy via `??=` so unused features don't
/// instantiate.
abstract class IRepositoryStorage {
  IAuthDao get authDao;

  /// Network
  IRestClient get restClient;

  IAuthRepository get authRepository;

  IAuthRemoteDS get authRemoteDataSource;

  IHomeRepository get homeRepository;

  IHomeRemoteDS get homeRemoteDataSource;

  IProfileRepository get profileRepository;

  IProfileRemoteDS get profileRemoteDataSource;

  void close();
}

class RepositoryStorage implements IRepositoryStorage {
  RepositoryStorage({
    required this._sharedPreferences,
    required this._packageInfo,
    required this._apiBaseUrl,
  });

  // ignore: unused_field
  final SharedPreferencesWithCache _sharedPreferences;
  final PackageInfo _packageInfo;
  final String _apiBaseUrl;

  IAuthDao? _authDao;
  IAuthRepository? _authRepository;
  IAuthRemoteDS? _authRemoteDataSource;
  IRestClient? _restClient;

  IHomeRepository? _homeRepository;
  IHomeRemoteDS? _homeRemoteDataSource;

  IProfileRepository? _profileRepository;
  IProfileRemoteDS? _profileRemoteDataSource;

  @override
  Future<void> close() async {
    await _authRepository?.dispose();
    _authRepository = null;
    _authRemoteDataSource = null;
    _authDao = null;
    _restClient = null;
    _homeRepository = null;
    _homeRemoteDataSource = null;
    _profileRepository = null;
    _profileRemoteDataSource = null;
  }

  @override
  IAuthDao get authDao =>
      _authDao ??= AuthDao(sharedPreferences: _sharedPreferences);

  @override
  IAuthRepository get authRepository => _authRepository ??= AuthRepository(
    authDao: authDao,
    remoteDS: authRemoteDataSource,
  );

  @override
  IAuthRemoteDS get authRemoteDataSource =>
      _authRemoteDataSource ??= AuthRemoteDS(restClient: restClient);

  @override
  IHomeRepository get homeRepository =>
      _homeRepository ??= HomeRepositoryImpl(remoteDS: homeRemoteDataSource);

  @override
  IHomeRemoteDS get homeRemoteDataSource =>
      _homeRemoteDataSource ??= HomeRemoteDSImpl(restClient: restClient);

  @override
  IProfileRepository get profileRepository => _profileRepository ??=
      ProfileRepositoryImpl(remoteDS: profileRemoteDataSource);

  @override
  IProfileRemoteDS get profileRemoteDataSource =>
      _profileRemoteDataSource ??= ProfileRemoteDSImpl(restClient: restClient);

  @override
  IRestClient get restClient => _restClient ??= RestClientDio(
    baseUrl: _apiBaseUrl,
    dioClient: DioClient(
      baseUrl: _apiBaseUrl,
      interceptor: DioInterceptor(onUnauthorized: _notifySessionExpired),
      packageInfo: _packageInfo,
      getAccessToken: _getAccessToken,
    ),
  );

  String? _getAccessToken() => _authRepository?.accessToken;

  void _notifySessionExpired() {
    _authRepository?.notifySessionExpired();
  }
}
