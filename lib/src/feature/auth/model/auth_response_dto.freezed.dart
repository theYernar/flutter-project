// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthResponseDTO {

 UserDTO? get user; AuthTokenDTO? get token;
/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseDTOCopyWith<AuthResponseDTO> get copyWith => _$AuthResponseDTOCopyWithImpl<AuthResponseDTO>(this as AuthResponseDTO, _$identity);

  /// Serializes this AuthResponseDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponseDTO&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,token);

@override
String toString() {
  return 'AuthResponseDTO(user: $user, token: $token)';
}


}

/// @nodoc
abstract mixin class $AuthResponseDTOCopyWith<$Res>  {
  factory $AuthResponseDTOCopyWith(AuthResponseDTO value, $Res Function(AuthResponseDTO) _then) = _$AuthResponseDTOCopyWithImpl;
@useResult
$Res call({
 UserDTO? user, AuthTokenDTO? token
});


$UserDTOCopyWith<$Res>? get user;$AuthTokenDTOCopyWith<$Res>? get token;

}
/// @nodoc
class _$AuthResponseDTOCopyWithImpl<$Res>
    implements $AuthResponseDTOCopyWith<$Res> {
  _$AuthResponseDTOCopyWithImpl(this._self, this._then);

  final AuthResponseDTO _self;
  final $Res Function(AuthResponseDTO) _then;

/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? token = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDTO?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as AuthTokenDTO?,
  ));
}
/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDTOCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserDTOCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokenDTOCopyWith<$Res>? get token {
    if (_self.token == null) {
    return null;
  }

  return $AuthTokenDTOCopyWith<$Res>(_self.token!, (value) {
    return _then(_self.copyWith(token: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResponseDTO].
extension AuthResponseDTOPatterns on AuthResponseDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponseDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponseDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponseDTO value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponseDTO():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponseDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponseDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserDTO? user,  AuthTokenDTO? token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponseDTO() when $default != null:
return $default(_that.user,_that.token);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserDTO? user,  AuthTokenDTO? token)  $default,) {final _that = this;
switch (_that) {
case _AuthResponseDTO():
return $default(_that.user,_that.token);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserDTO? user,  AuthTokenDTO? token)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponseDTO() when $default != null:
return $default(_that.user,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponseDTO implements AuthResponseDTO {
  const _AuthResponseDTO({this.user, this.token});
  factory _AuthResponseDTO.fromJson(Map<String, dynamic> json) => _$AuthResponseDTOFromJson(json);

@override final  UserDTO? user;
@override final  AuthTokenDTO? token;

/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseDTOCopyWith<_AuthResponseDTO> get copyWith => __$AuthResponseDTOCopyWithImpl<_AuthResponseDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponseDTO&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,token);

@override
String toString() {
  return 'AuthResponseDTO(user: $user, token: $token)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseDTOCopyWith<$Res> implements $AuthResponseDTOCopyWith<$Res> {
  factory _$AuthResponseDTOCopyWith(_AuthResponseDTO value, $Res Function(_AuthResponseDTO) _then) = __$AuthResponseDTOCopyWithImpl;
@override @useResult
$Res call({
 UserDTO? user, AuthTokenDTO? token
});


@override $UserDTOCopyWith<$Res>? get user;@override $AuthTokenDTOCopyWith<$Res>? get token;

}
/// @nodoc
class __$AuthResponseDTOCopyWithImpl<$Res>
    implements _$AuthResponseDTOCopyWith<$Res> {
  __$AuthResponseDTOCopyWithImpl(this._self, this._then);

  final _AuthResponseDTO _self;
  final $Res Function(_AuthResponseDTO) _then;

/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? token = freezed,}) {
  return _then(_AuthResponseDTO(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserDTO?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as AuthTokenDTO?,
  ));
}

/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDTOCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserDTOCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokenDTOCopyWith<$Res>? get token {
    if (_self.token == null) {
    return null;
  }

  return $AuthTokenDTOCopyWith<$Res>(_self.token!, (value) {
    return _then(_self.copyWith(token: value));
  });
}
}


/// @nodoc
mixin _$AuthTokenDTO {

 String? get type; String? get accessToken; String? get expiresAt;
/// Create a copy of AuthTokenDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokenDTOCopyWith<AuthTokenDTO> get copyWith => _$AuthTokenDTOCopyWithImpl<AuthTokenDTO>(this as AuthTokenDTO, _$identity);

  /// Serializes this AuthTokenDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthTokenDTO&&(identical(other.type, type) || other.type == type)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,accessToken,expiresAt);

@override
String toString() {
  return 'AuthTokenDTO(type: $type, accessToken: $accessToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $AuthTokenDTOCopyWith<$Res>  {
  factory $AuthTokenDTOCopyWith(AuthTokenDTO value, $Res Function(AuthTokenDTO) _then) = _$AuthTokenDTOCopyWithImpl;
@useResult
$Res call({
 String? type, String? accessToken, String? expiresAt
});




}
/// @nodoc
class _$AuthTokenDTOCopyWithImpl<$Res>
    implements $AuthTokenDTOCopyWith<$Res> {
  _$AuthTokenDTOCopyWithImpl(this._self, this._then);

  final AuthTokenDTO _self;
  final $Res Function(AuthTokenDTO) _then;

/// Create a copy of AuthTokenDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? accessToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthTokenDTO].
extension AuthTokenDTOPatterns on AuthTokenDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthTokenDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthTokenDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthTokenDTO value)  $default,){
final _that = this;
switch (_that) {
case _AuthTokenDTO():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthTokenDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AuthTokenDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  String? accessToken,  String? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthTokenDTO() when $default != null:
return $default(_that.type,_that.accessToken,_that.expiresAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  String? accessToken,  String? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _AuthTokenDTO():
return $default(_that.type,_that.accessToken,_that.expiresAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  String? accessToken,  String? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _AuthTokenDTO() when $default != null:
return $default(_that.type,_that.accessToken,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthTokenDTO implements AuthTokenDTO {
  const _AuthTokenDTO({this.type, this.accessToken, this.expiresAt});
  factory _AuthTokenDTO.fromJson(Map<String, dynamic> json) => _$AuthTokenDTOFromJson(json);

@override final  String? type;
@override final  String? accessToken;
@override final  String? expiresAt;

/// Create a copy of AuthTokenDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTokenDTOCopyWith<_AuthTokenDTO> get copyWith => __$AuthTokenDTOCopyWithImpl<_AuthTokenDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthTokenDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthTokenDTO&&(identical(other.type, type) || other.type == type)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,accessToken,expiresAt);

@override
String toString() {
  return 'AuthTokenDTO(type: $type, accessToken: $accessToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$AuthTokenDTOCopyWith<$Res> implements $AuthTokenDTOCopyWith<$Res> {
  factory _$AuthTokenDTOCopyWith(_AuthTokenDTO value, $Res Function(_AuthTokenDTO) _then) = __$AuthTokenDTOCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? accessToken, String? expiresAt
});




}
/// @nodoc
class __$AuthTokenDTOCopyWithImpl<$Res>
    implements _$AuthTokenDTOCopyWith<$Res> {
  __$AuthTokenDTOCopyWithImpl(this._self, this._then);

  final _AuthTokenDTO _self;
  final $Res Function(_AuthTokenDTO) _then;

/// Create a copy of AuthTokenDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? accessToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_AuthTokenDTO(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
