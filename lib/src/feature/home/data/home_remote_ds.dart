import 'package:flutter_project/src/core/rest_client/rest_client.dart';

abstract interface class IHomeRemoteDS {}

class HomeRemoteDSImpl implements IHomeRemoteDS {
  const HomeRemoteDSImpl({required this.restClient});

  final IRestClient restClient;
}
