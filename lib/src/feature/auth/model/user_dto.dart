import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
sealed class UserDTO with _$UserDTO {
  const factory UserDTO({
    int? id,
    String? name,
    String? phone,
    String? role,
    String? avatarPath,
    String? createdAt,
    String? updatedAt,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}
