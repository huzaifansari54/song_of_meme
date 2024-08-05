// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatRespone {
  bool get isLoading => throw _privateConstructorUsedError;
  ApiFailure? get failure => throw _privateConstructorUsedError;
  SongEntity? get song => throw _privateConstructorUsedError;
  String get messaage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatResponeCopyWith<ChatRespone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponeCopyWith<$Res> {
  factory $ChatResponeCopyWith(
          ChatRespone value, $Res Function(ChatRespone) then) =
      _$ChatResponeCopyWithImpl<$Res, ChatRespone>;
  @useResult
  $Res call(
      {bool isLoading, ApiFailure? failure, SongEntity? song, String messaage});

  $ApiFailureCopyWith<$Res>? get failure;
  $SongEntityCopyWith<$Res>? get song;
}

/// @nodoc
class _$ChatResponeCopyWithImpl<$Res, $Val extends ChatRespone>
    implements $ChatResponeCopyWith<$Res> {
  _$ChatResponeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failure = freezed,
    Object? song = freezed,
    Object? messaage = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ApiFailure?,
      song: freezed == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongEntity?,
      messaage: null == messaage
          ? _value.messaage
          : messaage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $SongEntityCopyWith<$Res>? get song {
    if (_value.song == null) {
      return null;
    }

    return $SongEntityCopyWith<$Res>(_value.song!, (value) {
      return _then(_value.copyWith(song: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatResponeImplCopyWith<$Res>
    implements $ChatResponeCopyWith<$Res> {
  factory _$$ChatResponeImplCopyWith(
          _$ChatResponeImpl value, $Res Function(_$ChatResponeImpl) then) =
      __$$ChatResponeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, ApiFailure? failure, SongEntity? song, String messaage});

  @override
  $ApiFailureCopyWith<$Res>? get failure;
  @override
  $SongEntityCopyWith<$Res>? get song;
}

/// @nodoc
class __$$ChatResponeImplCopyWithImpl<$Res>
    extends _$ChatResponeCopyWithImpl<$Res, _$ChatResponeImpl>
    implements _$$ChatResponeImplCopyWith<$Res> {
  __$$ChatResponeImplCopyWithImpl(
      _$ChatResponeImpl _value, $Res Function(_$ChatResponeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failure = freezed,
    Object? song = freezed,
    Object? messaage = null,
  }) {
    return _then(_$ChatResponeImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ApiFailure?,
      song: freezed == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as SongEntity?,
      messaage: null == messaage
          ? _value.messaage
          : messaage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatResponeImpl extends _ChatRespone {
  const _$ChatResponeImpl(
      {required this.isLoading,
      required this.failure,
      required this.song,
      required this.messaage})
      : super._();

  @override
  final bool isLoading;
  @override
  final ApiFailure? failure;
  @override
  final SongEntity? song;
  @override
  final String messaage;

  @override
  String toString() {
    return 'ChatRespone(isLoading: $isLoading, failure: $failure, song: $song, messaage: $messaage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatResponeImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.song, song) || other.song == song) &&
            (identical(other.messaage, messaage) ||
                other.messaage == messaage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, failure, song, messaage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatResponeImplCopyWith<_$ChatResponeImpl> get copyWith =>
      __$$ChatResponeImplCopyWithImpl<_$ChatResponeImpl>(this, _$identity);
}

abstract class _ChatRespone extends ChatRespone {
  const factory _ChatRespone(
      {required final bool isLoading,
      required final ApiFailure? failure,
      required final SongEntity? song,
      required final String messaage}) = _$ChatResponeImpl;
  const _ChatRespone._() : super._();

  @override
  bool get isLoading;
  @override
  ApiFailure? get failure;
  @override
  SongEntity? get song;
  @override
  String get messaage;
  @override
  @JsonKey(ignore: true)
  _$$ChatResponeImplCopyWith<_$ChatResponeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
