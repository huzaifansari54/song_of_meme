import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/entity/song_entity.dart';

import '../../../../core/exeption/failure_model.dart';

abstract interface class ISongOfMemeRepository {
  TaskEither<ApiFailure, List<SongEntity>> getAllSong();
  TaskEither<ApiFailure, SongEntity> getSongById({required num songId});
  TaskEither<ApiFailure, SongEntity> getUserSong({required num pageI});
  TaskEither<ApiFailure, SongEntity> createSong({required String lyrics});
  TaskEither<ApiFailure, SongEntity> createCustomeSong({required DataMap body});
  TaskEither<ApiFailure, String> like({required num songId});
  TaskEither<ApiFailure, String> disLike({required num songId});
  TaskEither<ApiFailure, String> view({required num songId});
  TaskEither<ApiFailure, SongEntity> cloneSong(
      {required File file, required String prompt, required String lyrics});
}
