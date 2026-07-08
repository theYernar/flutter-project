// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => _UserDTO(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  avatarPath: json['avatar_path'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$UserDTOToJson(_UserDTO instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'phone': ?instance.phone,
  'role': ?instance.role,
  'avatar_path': ?instance.avatarPath,
  'created_at': ?instance.createdAt,
  'updated_at': ?instance.updatedAt,
};
