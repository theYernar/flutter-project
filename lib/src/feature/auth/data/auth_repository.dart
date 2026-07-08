import 'dart:async';

import 'package:project/src/feature/auth/data/auth_remote_ds.dart';
import 'package:project/src/feature/auth/database/auth_dao.dart';
import 'package:project/src/feature/auth/model/auth_response_dto.dart';

abstract interface class IAuthRepository {
  bool get isAuthenticated;

  String? get accessToken;

  Stream<void> get sessionExpired;

  Future<void> logout();

  void notifySessionExpired();

  Future<void> dispose();
}

final class AuthRepository implements IAuthRepository {
  AuthRepository({required this._authDao, required this._remoteDS});

  final IAuthDao _authDao;
  final IAuthRemoteDS _remoteDS;
  final StreamController<void> _sessionExpiredController =
      StreamController<void>.broadcast();

  @override
  bool get isAuthenticated => accessToken?.isNotEmpty ?? false;

  @override
  String? get accessToken => _readAccessToken();

  @override
  Stream<void> get sessionExpired => _sessionExpiredController.stream;

  Future<AuthResponseDTO> _saveAccessTokenFromAuthResponse(
    AuthResponseDTO authResponse, {
    required String missingTokenMessage,
  }) async {
    final accessToken = authResponse.token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw StateError(
        '$missingTokenMessage response did not include access token',
      );
    }

    await _saveAccessToken(accessToken);
    return authResponse;
  }

  @override
  Future<void> logout() => _authDao.session.remove();

  @override
  void notifySessionExpired() {
    if (!_sessionExpiredController.isClosed) {
      _sessionExpiredController.add(null);
    }
  }

  @override
  Future<void> dispose() => _sessionExpiredController.close();

  String? _readAccessToken() {
    final session = _authDao.session.value?.trim();
    if (session == null || session.isEmpty) return null;
    return session;
  }

  Future<void> _saveAccessToken(String accessToken) async {
    await _authDao.session.setValue(accessToken);
  }
}
