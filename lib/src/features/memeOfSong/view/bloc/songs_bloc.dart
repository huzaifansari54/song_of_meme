import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/is_user_login_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/model/song_model.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/entity/song_entity.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/dislike_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/get_all_songs.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/get_song_by_id_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/like_song_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/use_case/view_song_use_case.dart';
import 'package:song_of_meme/src/features/memeOfSong/view/bloc/state/song_state.dart';
import '../../../../lc.dart';

final songsBloc = StateNotifierProvider<SongsBloc, SongState>(
    (_) => SongsBloc(lc(), lc(), lc(), lc(), lc()));

class SongsBloc extends StateNotifier<SongState> {
  final GetAllSongsUseCase _getAllSongsUseCase;
  final LikeSongUseCase _likeSongUseCase;
  final DislikeUseCase _dislikeUseCase;
  final ViewSongUseCase _viewSongUseCase;
  final GetSongByIdUseCase _getSongByIdUseCase;

  SongsBloc(this._getAllSongsUseCase, this._likeSongUseCase,
      this._dislikeUseCase, this._getSongByIdUseCase, this._viewSongUseCase)
      : super(SongState.init());

  setQuery(String query) {
    state = state.copyWith(query: query);
    if (state.query.isEmpty) {
      state = state.copyWith(
          isLoading: false, allSongOrFailure: Either.of(state.allSongs));
    }
  }

  getSongById(BuildContext context) async {
    if (state.query.isEmpty) {
      context.snackbar("Song id Please");
      return;
    }
    final songId = num.tryParse(state.query);

    if ((songId == null)) {
      context.snackbar("serch with song id number");
      return;
    }

    state = state.copyWith(isLoading: true);

    final songQuery =
        state.allSongs.where((song) => song.song_id == songId.toString());

    if (songQuery.isNotEmpty) {
      final song = songQuery;
      state = state.copyWith(
          isLoading: false, allSongOrFailure: Either.of(song.toList()));
      return;
    }
    final likeCount = Map<num, num>.from(state.likeCount);
    final likeByUser = Map<num, bool>.from(state.isUserLike);
    final resultOrFailure =
        await _getSongByIdUseCase(param: GetSongByIdParm(songId: songId)).run();
    resultOrFailure.map((song) => song.toMaodel()).match((_) {}, ((song) {
      likeCount.putIfAbsent(song.song_id, () => song.likes);
      likeByUser.putIfAbsent(song.song_id, () => false);
      state = state.copyWith(likeCount: likeCount, isUserLike: likeByUser);
    }));

    final song = resultOrFailure.flatMap((model) => Either.of([model]));
    state = state.copyWith(isLoading: false, allSongOrFailure: song);
  }

  getAllSongs() async {
    if (state.allSongs.isNotEmpty) return;
    state = state.copyWith(isLoading: true);
    final likeCount = Map<num, num>.from(state.likeCount);
    final likeByUser = Map<num, bool>.from(state.isUserLike);
    final dataOrFailure = await _getAllSongsUseCase(param: NoParm()).run();

    dataOrFailure.map((song) => song.map((e) => e.toMaodel())).match((_) {},
        ((songs) {
      for (var song in songs) {
        likeCount.putIfAbsent(song.song_id, () => song.likes);
        likeByUser.putIfAbsent(song.song_id, () => false);
      }
      state = state.copyWith(
          allSongs: songs.map((song) => song.toEntity()).toList(),
          likeCount: likeCount,
          isUserLike: likeByUser);
    }));

    state = state.copyWith(isLoading: false, allSongOrFailure: dataOrFailure);
  }

  like(num songId) {
    final likeCount = Map<num, num>.from(state.likeCount);
    final likeByUser = Map<num, bool>.from(state.isUserLike);
    _like(songId);
    if ((state.isUserLike[songId]) ?? false) {
      return;
    }
    likeByUser.update(songId, (_) => true);
    state = state.copyWith(isUserLike: likeByUser);
    likeCount.update(songId, (update) => (update + 1));
    state = state.copyWith(likeCount: likeCount);
  }

  dislike(num songId) {
    final likeCount = Map<num, num>.from(state.likeCount);
    final likeByUser = Map<num, bool>.from(state.isUserLike);
    _dislike(songId);
    if ((state.isUserLike[songId]) ?? false) {
      likeByUser.update(songId, (_) => false);
      state = state.copyWith(isUserLike: likeByUser);
      likeCount.update(songId, (update) => (update - 1));
      state = state.copyWith(likeCount: likeCount);
      return;
    }
  }

  view(num songId) async {
    await _viewSongUseCase(param: ViewSongParam(songId: songId)).run();
  }

  _like(num songId) async {
    await _likeSongUseCase(param: LikeSongParam(songId: songId)).run();
  }

  _dislike(num songId) async {
    await _dislikeUseCase(param: DisLikeSongParam(songId: songId)).run();
  }
}
