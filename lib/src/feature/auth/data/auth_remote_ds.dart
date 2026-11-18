import 'package:flutter_project/src/core/rest_client/rest_client.dart';

abstract interface class IAuthRemoteDS {}

final class AuthRemoteDS implements IAuthRemoteDS {
  const AuthRemoteDS({required this._restClient});

  final IRestClient _restClient;
}
