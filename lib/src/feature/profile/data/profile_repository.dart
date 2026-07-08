import 'package:project/src/feature/profile/data/profile_remote_ds.dart';

abstract interface class IProfileRepository {}

class ProfileRepositoryImpl implements IProfileRepository {
  const ProfileRepositoryImpl({required this._remoteDS});

  final IProfileRemoteDS _remoteDS;
}
