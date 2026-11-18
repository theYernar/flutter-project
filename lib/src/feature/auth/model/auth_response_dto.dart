import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_project/src/feature/auth/model/user_dto.dart';

part 'auth_response_dto.freezed.dart';
part 'auth_response_dto.g.dart';

@freezed
sealed class AuthResponseDTO with _$AuthResponseDTO {
  const factory AuthResponseDTO({UserDTO? user, AuthTokenDTO? token}) =
      _AuthResponseDTO;

  factory AuthResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDTOFromJson(json);
}

@freezed
sealed class AuthTokenDTO with _$AuthTokenDTO {
  const factory AuthTokenDTO({
    String? type,
    String? accessToken,
    String? expiresAt,
  }) = _AuthTokenDTO;

  factory AuthTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenDTOFromJson(json);
}
