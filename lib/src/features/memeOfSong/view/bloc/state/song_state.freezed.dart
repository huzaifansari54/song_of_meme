// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SongState {
  bool get isLoading => throw _privateConstructorUsedError;
  Map<num, bool> get isUserLike => throw _privateConstructorUsedError;
  Map<num, num> get likeCount => throw _privateConstructorUsedError;
  List<SongEntity> get allSongs => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  Either<ApiFailure, List<SongEntity>> get allSongOrFailure =>
      throw _privateConstructorUsedError;
  Either<ApiFailure, List<SongEntity>> get userSongOrFailure =>
      throw _privateConstructorUsedError;
  Either<ApiFailure, List<SongEntity>> get getSongByIdOrFailure =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongStateCopyWith<SongState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongStateCopyWith<$Res> {
  factory $SongStateCopyWith(SongState value, $Res Function(SongState) then) =
      _$SongStateCopyWithImpl<$Res, SongState>;
  @useResult
  $Res call(
      {bool isLoading,
      Map<num, bool> isUserLike,
      Map<num, num> likeCount,
      List<SongEntity> allSongs,
      String query,
      Either<ApiFailure, List<SongEntity>> allSongOrFailure,
      Either<ApiFailure, List<SongEntity>> userSongOrFailure,
      Either<ApiFailure, List<SongEntity>> getSongByIdOrFailure});
}

/// @nodoc
class _$SongStateCopyWithImpl<$Res, $Val extends SongState>
    implements $SongStateCopyWith<$Res> {
  _$SongStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUserLike = null,
    Object? likeCount = null,
    Object? allSongs = null,
    Object? query = null,
    Object? allSongOrFailure = null,
    Object? userSongOrFailure = null,
    Object? getSongByIdOrFailure = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserLike: null == isUserLike
          ? _value.isUserLike
          : isUserLike // ignore: cast_nullable_to_non_nullable
              as Map<num, bool>,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as Map<num, num>,
      allSongs: null == allSongs
          ? _value.allSongs
          : allSongs // ignore: cast_nullable_to_non_nullable
              as List<SongEntity>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      allSongOrFailure: null == allSongOrFailure
          ? _value.allSongOrFailure
          : allSongOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<ApiFailure, List<SongEntity>>,
      userSongOrFailure: null == userSongOrFailure
          ? _value.userSongOrFailure
          : userSongOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<ApiFailure, List<SongEntity>>,
      getSongByIdOrFailure: null == getSongByIdOrFailure
          ? _value.getSongByIdOrFailure
          : getSongByIdOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<ApiFailure, List<SongEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongStateImplCopyWith<$Res>
    implements $SongStateCopyWith<$Res> {
  factory _$$SongStateImplCopyWith(
          _$SongStateImpl value, $Res Function(_$SongStateImpl) then) =
      __$$SongStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Map<num, bool> isUserLike,
      Map<num, num> likeCount,
      List<SongEntity> allSongs,
      String query,
      Either<ApiFailure, List<SongEntity>> allSongOrFailure,
      Either<ApiFailure, List<SongEntity>> userSongOrFailure,
      Either<ApiFailure, List<SongEntity>> getSongByIdOrFailure});
}

/// @nodoc
class __$$SongStateImplCopyWithImpl<$Res>
    extends _$SongStateCopyWithImpl<$Res, _$SongStateImpl>
    implements _$$SongStateImplCopyWith<$Res> {
  __$$SongStateImplCopyWithImpl(
      _$SongStateImpl _value, $Res Function(_$SongStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUserLike = null,
    Object? likeCount = null,
    Object? allSongs = null,
    Object? query = null,
    Object? allSongOrFailure = null,
    Object? userSongOrFailure = null,
    Object? getSongByIdOrFailure = null,
  }) {
    return _then(_$SongStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserLike: null == isUserLike
          ? _value._isUserLike
          : isUserLike // ignore: cast_nullable_to_non_nullable
              as Map<num, bool>,
      likeCount: null == likeCount
          ? _value._likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as Map<num, num>,
      allSongs: null == allSongs
          ? _value._allSongs
          : allSongs // ignore: cast_nullable_to_non_nullable
              as List<SongEntity>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      allSongOrFailure: null == allSongOrFailure
          ? _value.allSongOrFailure
          : allSongOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<ApiFailure, List<SongEntity>>,
      userSongOrFailure: null == userSongOrFailure
          ? _value.userSongOrFailure
          : userSongOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<ApiFailure, List<SongEntity>>,
      getSongByIdOrFailure: null == getSongByIdOrFailure
          ? _value.getSongByIdOrFailure
          : getSongByIdOrFailure // ignore: cast_nullable_to_non_nullable
              as Either<ApiFailure, List<SongEntity>>,
    ));
  }
}

/// @nodoc

class _$SongStateImpl extends _SongState {
  const _$SongStateImpl(
      {required this.isLoading,
      required final Map<num, bool> isUserLike,
      required final Map<num, num> likeCount,
      required final List<SongEntity> allSongs,
      required this.query,
      required this.allSongOrFailure,
      required this.userSongOrFailure,
      required this.getSongByIdOrFailure})
      : _isUserLike = isUserLike,
        _likeCount = likeCount,
        _allSongs = allSongs,
        super._();

  @override
  final bool isLoading;
  final Map<num, bool> _isUserLike;
  @override
  Map<num, bool> get isUserLike {
    if (_isUserLike is EqualUnmodifiableMapView) return _isUserLike;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isUserLike);
  }

  final Map<num, num> _likeCount;
  @override
  Map<num, num> get likeCount {
    if (_likeCount is EqualUnmodifiableMapView) return _likeCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_likeCount);
  }

  final List<SongEntity> _allSongs;
  @override
  List<SongEntity> get allSongs {
    if (_allSongs is EqualUnmodifiableListView) return _allSongs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allSongs);
  }

  @override
  final String query;
  @override
  final Either<ApiFailure, List<SongEntity>> allSongOrFailure;
  @override
  final Either<ApiFailure, List<SongEntity>> userSongOrFailure;
  @override
  final Either<ApiFailure, List<SongEntity>> getSongByIdOrFailure;

  @override
  String toString() {
    return 'SongState(isLoading: $isLoading, isUserLike: $isUserLike, likeCount: $likeCount, allSongs: $allSongs, query: $query, allSongOrFailure: $allSongOrFailure, userSongOrFailure: $userSongOrFailure, getSongByIdOrFailure: $getSongByIdOrFailure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._isUserLike, _isUserLike) &&
            const DeepCollectionEquality()
                .equals(other._likeCount, _likeCount) &&
            const DeepCollectionEquality().equals(other._allSongs, _allSongs) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.allSongOrFailure, allSongOrFailure) ||
                other.allSongOrFailure == allSongOrFailure) &&
            (identical(other.userSongOrFailure, userSongOrFailure) ||
                other.userSongOrFailure == userSongOrFailure) &&
            (identical(other.getSongByIdOrFailure, getSongByIdOrFailure) ||
                other.getSongByIdOrFailure == getSongByIdOrFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_isUserLike),
      const DeepCollectionEquality().hash(_likeCount),
      const DeepCollectionEquality().hash(_allSongs),
      query,
      allSongOrFailure,
      userSongOrFailure,
      getSongByIdOrFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongStateImplCopyWith<_$SongStateImpl> get copyWith =>
      __$$SongStateImplCopyWithImpl<_$SongStateImpl>(this, _$identity);
}

abstract class _SongState extends SongState {
  const factory _SongState(
      {required final bool isLoading,
      required final Map<num, bool> isUserLike,
      required final Map<num, num> likeCount,
      required final List<SongEntity> allSongs,
      required final String query,
      required final Either<ApiFailure, List<SongEntity>> allSongOrFailure,
      required final Either<ApiFailure, List<SongEntity>> userSongOrFailure,
      required final Either<ApiFailure, List<SongEntity>>
          getSongByIdOrFailure}) = _$SongStateImpl;
  const _SongState._() : super._();

  @override
  bool get isLoading;
  @override
  Map<num, bool> get isUserLike;
  @override
  Map<num, num> get likeCount;
  @override
  List<SongEntity> get allSongs;
  @override
  String get query;
  @override
  Either<ApiFailure, List<SongEntity>> get allSongOrFailure;
  @override
  Either<ApiFailure, List<SongEntity>> get userSongOrFailure;
  @override
  Either<ApiFailure, List<SongEntity>> get getSongByIdOrFailure;
  @override
  @JsonKey(ignore: true)
  _$$SongStateImplCopyWith<_$SongStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
