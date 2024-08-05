import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/entity/song_entity.dart';

import '../../../../../core/exeption/failure_model.dart';
part 'song_state.freezed.dart';

@freezed
abstract class SongState with _$SongState {
  const SongState._();
  const factory SongState(
          {required bool isLoading,
          required Map<num, bool> isUserLike,
          required Map<num, num> likeCount,
          required List<SongEntity> allSongs,
          required String query,
          required Either<ApiFailure, List<SongEntity>> allSongOrFailure,
          required Either<ApiFailure, List<SongEntity>> userSongOrFailure,
          required Either<ApiFailure, List<SongEntity>> getSongByIdOrFailure}) =
      _SongState;
  Map<num, bool> get likeByUser => Map.from(isUserLike);
  Map<num, num> get likeCounts => Map.from(likeCount);
  factory SongState.init() => SongState(
      allSongs: [],
      isLoading: false,
      query: "",
      isUserLike: {},
      likeCount: {},
      allSongOrFailure: Either.of([]),
      userSongOrFailure: Either.of([]),
      getSongByIdOrFailure: Either.of([]));
}
