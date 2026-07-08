import 'package:project/src/feature/home/data/home_remote_ds.dart';

abstract interface class IHomeRepository {}

class HomeRepositoryImpl implements IHomeRepository {
  const HomeRepositoryImpl({required this._remoteDS});

  final IHomeRemoteDS _remoteDS;
}
