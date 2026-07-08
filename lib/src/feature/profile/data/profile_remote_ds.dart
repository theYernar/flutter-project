import 'package:project/src/core/rest_client/rest_client.dart';

abstract interface class IProfileRemoteDS {}

class ProfileRemoteDSImpl implements IProfileRemoteDS {
  const ProfileRemoteDSImpl({required this.restClient});

  final IRestClient restClient;
}
