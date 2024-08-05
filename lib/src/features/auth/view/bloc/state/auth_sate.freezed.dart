// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_sate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthSate {
  AuthModel get authModel => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLogin => throw _privateConstructorUsedError;
  ApiFailure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthSateCopyWith<AuthSate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSateCopyWith<$Res> {
  factory $AuthSateCopyWith(AuthSate value, $Res Function(AuthSate) then) =
      _$AuthSateCopyWithImpl<$Res, AuthSate>;
  @useResult
  $Res call(
      {AuthModel authModel,
      String email,
      String name,
      String password,
      bool isLoading,
      bool isLogin,
      ApiFailure? failure});

  $AuthModelCopyWith<$Res> get authModel;
  $ApiFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$AuthSateCopyWithImpl<$Res, $Val extends AuthSate>
    implements $AuthSateCopyWith<$Res> {
  _$AuthSateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authModel = null,
    Object? email = null,
    Object? name = null,
    Object? password = null,
    Object? isLoading = null,
    Object? isLogin = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      authModel: null == authModel
          ? _value.authModel
          : authModel // ignore: cast_nullable_to_non_nullable
              as AuthModel,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ApiFailure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthModelCopyWith<$Res> get authModel {
    return $AuthModelCopyWith<$Res>(_value.authModel, (value) {
      return _then(_value.copyWith(authModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $ApiFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthSateImplCopyWith<$Res>
    implements $AuthSateCopyWith<$Res> {
  factory _$$AuthSateImplCopyWith(
          _$AuthSateImpl value, $Res Function(_$AuthSateImpl) then) =
      __$$AuthSateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthModel authModel,
      String email,
      String name,
      String password,
      bool isLoading,
      bool isLogin,
      ApiFailure? failure});

  @override
  $AuthModelCopyWith<$Res> get authModel;
  @override
  $ApiFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$AuthSateImplCopyWithImpl<$Res>
    extends _$AuthSateCopyWithImpl<$Res, _$AuthSateImpl>
    implements _$$AuthSateImplCopyWith<$Res> {
  __$$AuthSateImplCopyWithImpl(
      _$AuthSateImpl _value, $Res Function(_$AuthSateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authModel = null,
    Object? email = null,
    Object? name = null,
    Object? password = null,
    Object? isLoading = null,
    Object? isLogin = null,
    Object? failure = freezed,
  }) {
    return _then(_$AuthSateImpl(
      authModel: null == authModel
          ? _value.authModel
          : authModel // ignore: cast_nullable_to_non_nullable
              as AuthModel,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogin: null == isLogin
          ? _value.isLogin
          : isLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ApiFailure?,
    ));
  }
}

/// @nodoc

class _$AuthSateImpl extends _AuthSate {
  const _$AuthSateImpl(
      {required this.authModel,
      required this.email,
      required this.name,
      required this.password,
      required this.isLoading,
      required this.isLogin,
      required this.failure})
      : super._();

  @override
  final AuthModel authModel;
  @override
  final String email;
  @override
  final String name;
  @override
  final String password;
  @override
  final bool isLoading;
  @override
  final bool isLogin;
  @override
  final ApiFailure? failure;

  @override
  String toString() {
    return 'AuthSate(authModel: $authModel, email: $email, name: $name, password: $password, isLoading: $isLoading, isLogin: $isLogin, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSateImpl &&
            (identical(other.authModel, authModel) ||
                other.authModel == authModel) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLogin, isLogin) || other.isLogin == isLogin) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authModel, email, name, password,
      isLoading, isLogin, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSateImplCopyWith<_$AuthSateImpl> get copyWith =>
      __$$AuthSateImplCopyWithImpl<_$AuthSateImpl>(this, _$identity);
}

abstract class _AuthSate extends AuthSate {
  const factory _AuthSate(
      {required final AuthModel authModel,
      required final String email,
      required final String name,
      required final String password,
      required final bool isLoading,
      required final bool isLogin,
      required final ApiFailure? failure}) = _$AuthSateImpl;
  const _AuthSate._() : super._();

  @override
  AuthModel get authModel;
  @override
  String get email;
  @override
  String get name;
  @override
  String get password;
  @override
  bool get isLoading;
  @override
  bool get isLogin;
  @override
  ApiFailure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$AuthSateImplCopyWith<_$AuthSateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
