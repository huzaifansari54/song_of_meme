import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:song_of_meme/src/core/exeption/dio_exception.dart';
import 'package:song_of_meme/src/core/exeption/exceptions.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/data_source/remote/i_song_of_meme_data_source.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/model/song_model.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/entity/song_entity.dart';
import 'package:song_of_meme/src/features/memeOfSong/domain/repository/repository.dart';

class SongOfMemeRepository implements ISongOfMemeRepository {
  final ISongOfMemeDataSource _dataSource;

  SongOfMemeRepository({required ISongOfMemeDataSource dataSource})
      : _dataSource = dataSource;
  @override
  TaskEither<ApiFailure, SongEntity> cloneSong(
      {required File file, required String prompt, required String lyrics}) {
    return TaskEither.tryCatch(
        () => _dataSource.cloneSong(file: file, prompt: prompt, lyrics: lyrics),
        (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return error.failure!;
    }).map((model) => model.toEntity());
  }

  @override
  TaskEither<ApiFailure, SongEntity> createCustomeSong(
      {required DataMap body}) {
    return TaskEither.tryCatch(() => _dataSource.createCustomeSong(body: body),
        (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return error.failure!;
    }).map((model) => model.toEntity());
  }

  @override
  TaskEither<ApiFailure, SongEntity> createSong({required String lyrics}) {
    return TaskEither.tryCatch(() => _dataSource.createSong(lyrics: lyrics),
        (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return error.failure!;
    }).map((model) => model.toEntity());
  }

  @override
  TaskEither<ApiFailure, String> disLike({required num songId}) {
    return TaskEither.tryCatch(() => _dataSource.disLike(songId: songId),
        (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return ApiFailure.serverFailed(message: error.message);
    });
  }

  @override
  TaskEither<ApiFailure, List<SongEntity>> getAllSong() {
    return TaskEither.tryCatch(() => _dataSource.getAllSong(), (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      return ApiFailure.serverFailed(message: e.toString());
    }).map((model) => model.map((e) => e.toEntity()).toList());
  }

  @override
  TaskEither<ApiFailure, SongEntity> getSongById({required num songId}) {
    return TaskEither.tryCatch(() => _dataSource.getSongById(songId: songId),
        (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return error.failure!;
    }).map((model) => model.toEntity());
  }

  @override
  TaskEither<ApiFailure, SongEntity> getUserSong({required num pageI}) {
    return TaskEither.tryCatch(() => _dataSource.getUserSong(pageI: pageI),
        (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return ApiFailure.serverFailed(message: error.message);
    }).map((model) => model.toEntity());
  }

  @override
  TaskEither<ApiFailure, String> like({required num songId}) {
    return TaskEither.tryCatch(() => _dataSource.like(songId: songId), (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return ApiFailure.serverFailed(message: error.message);
    });
  }

  @override
  TaskEither<ApiFailure, String> view({required num songId}) {
    return TaskEither.tryCatch(() => _dataSource.view(songId: songId), (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return error.failure!;
    });
  }

  @override
  TaskEither<ApiFailure, Unit> downloadSong({required String url}) {
    // TODO: implement downloadSong
    throw UnimplementedError();
  }
}
