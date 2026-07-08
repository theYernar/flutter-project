// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponseDTO _$AuthResponseDTOFromJson(Map<String, dynamic> json) =>
    _AuthResponseDTO(
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] == null
          ? null
          : AuthTokenDTO.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseDTOToJson(_AuthResponseDTO instance) =>
    <String, dynamic>{'user': ?instance.user, 'token': ?instance.token};

_AuthTokenDTO _$AuthTokenDTOFromJson(Map<String, dynamic> json) =>
    _AuthTokenDTO(
      type: json['type'] as String?,
      accessToken: json['access_token'] as String?,
      expiresAt: json['expires_at'] as String?,
    );

Map<String, dynamic> _$AuthTokenDTOToJson(_AuthTokenDTO instance) =>
    <String, dynamic>{
      'type': ?instance.type,
      'access_token': ?instance.accessToken,
      'expires_at': ?instance.expiresAt,
    };
