import 'dart:io';

import 'package:dio/dio.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/auth/data/data_source/local/local_data_source.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/data_source/remote/i_song_of_meme_data_source.dart';
import 'package:song_of_meme/src/features/memeOfSong/data/model/song_model.dart';
import 'package:song_of_meme/src/lc.dart';
import '../../../../../core/exeption/exceptions.dart';
import '../../../../../core/exeption/failure_model.dart';

class SongOfMemeDataSource implements ISongOfMemeDataSource {
  final Dio _cleint;
  static const createPiont = "create";
  static const createCustomPiont = "createcustom";
  static const usersongsPiont = "usersongs";
  static const allsongsPiont = "allsongs";
  static const userPiont = "user";
  static const getsongbyidPiont = "getsongbyid";
  static const likePiont = "like";
  static const dislikePiont = "dislike";
  static const viewPiont = "view";
  static const clonesongiont = "clonesong";
  SongOfMemeDataSource({required Dio cleint}) : _cleint = cleint;
  final token = lc<ILocalDataSorce>().getUserToken();
  @override
  Future<SongModel> cloneSong(
      {required File file,
      required String prompt,
      required String lyrics}) async {
    try {
      final bytes = await file.readAsBytes();
      final fileData = MultipartFile.fromBytes(bytes.buffer.asUint8List());
      final data = {"file": fileData, "prompt": prompt, "lyrics": lyrics};
      FormData body = FormData.fromMap(data);
      final response = await _cleint.post(
          endpoint(SongOfMemeDataSource.createPiont),
          data: body,
          options: Options(headers: headerBearerOption(token)));
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final notFound = response.data["detail"];
      if (notFound != null) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final json = (response.data);
      final song = SongModel.fromJson(json);
      return song;
    } on DioException catch (e) {
      throw DioException(
          error: e.error,
          requestOptions: e.requestOptions,
          stackTrace: e.stackTrace,
          message: e.message,
          type: e.type);
    } on ApiException catch (e) {
      throw ApiException(
          failure: e.failure, message: e.message, status: e.status);
    }
  }

  @override
  Future<SongModel> createCustomeSong({required DataMap body}) async {
    try {
      final response = await _cleint.post(
          endpoint(SongOfMemeDataSource.createCustomPiont),
          data: body,
          options: Options(headers: headerBearerOption(token)));
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final notFound = response.data["detail"];
      if (notFound != null) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final json = (response.data);
      final song = SongModel.fromJson(json);
      return song;
    } on DioException catch (e) {
      throw DioException(
          error: e.error,
          requestOptions: e.requestOptions,
          stackTrace: e.stackTrace,
          message: e.message,
          type: e.type);
    } on ApiException catch (e) {
      throw ApiException(
          failure: e.failure, message: e.message, status: e.status);
    }
  }

  @override
  Future<SongModel> createSong({required String lyrics}) async {
    try {
      final response = await _cleint.post(
          endpoint(SongOfMemeDataSource.createPiont),
          data: {"song": lyrics},
          options: Options(headers: headerBearerOption(token)));
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final notFound = response.data["detail"];
      if (notFound != null) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final json = (response.data);
      final song = SongModel.fromJson(json);
      return song;
    } on DioException catch (e) {
      throw DioException(
          error: e.error,
          requestOptions: e.requestOptions,
          stackTrace: e.stackTrace,
          message: e.message,
          type: e.type);
    } on ApiException catch (e) {
      throw ApiException(
          failure: e.failure, message: e.message, status: e.status);
    }
  }

  @override
  Future<String> disLike({required num songId}) async {
    try {
      final response = await _cleint.post(
          endpoint(SongOfMemeDataSource.dislikePiont),
          data: {"song_id": songId},
          options: Options(headers: headerBearerOption(token)));
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final status = (response.data["status"]);
      return status;
    } on DioException catch (e) {
      throw DioException(
          error: e.error,
          requestOptions: e.requestOptions,
          stackTrace: e.stackTrace,
          message: e.message,
          type: e.type);
    } on ApiException catch (e) {
      throw ApiException(
          failure: e.failure, message: e.message, status: e.status);
    }
  }

  @override
  Future<List<SongModel>> getAllSong() async {
    try {
      final response = await _cleint.get(
          endpoint(SongOfMemeDataSource.allsongsPiont),
          data: headerBearerOption(token),
          queryParameters: {"page": 3});
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final notFound = response.data["detail"];
      if (notFound != null) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final songs = (response.data["songs"] as List<dynamic>)
          .map((song) => SongModel.fromJson(song))
          .toList();
      List<SongModel> temModel = [];
      for (var song in songs) {
        final id = await getLikesByUser(song.song_id);
        song = song.copyWith(isUseLike: id);
        temModel.add(song);
      }

      return temModel;
    } on DioException catch (e) {
      throw DioException(
          error: e.error,
          requestOptions: e.requestOptions,
          stackTrace: e.stackTrace,
          message: e.message,
          type: e.type);
    } on ApiException catch (e) {
      throw ApiException(
          failure: e.failure, message: e.message, status: e.status);
    }
  }

  @override
  Future<SongModel> getSongById({required num songId}) async {
    try {
      final response = await _cleint.get(
          endpoint(SongOfMemeDataSource.getsongbyidPiont),
          queryParameters: {"id": songId},
          options: Options(headers: headerBearerOption(token)));
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final notFound = response.data["detail"];
      if (notFound != null) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final json = (response.data);
      final song = SongModel.fromJson(json);
      return song;
    } on DioException catch (e) {
      throw DioException(
          error: e.error,
          requestOptions: e.requestOptions,
          stackTrace: e.stackTrace,
          message: e.message,
          type: e.type);
    } on ApiException catch (e) {
      throw ApiException(
          failure: e.failure, message: e.message, status: e.status);
    }
  }

  @override
  Future<SongModel> getUserSong({required num pageI}) async {
    try {
      final response = await _cleint.get(
          endpoint(SongOfMemeDataSource.usersongsPiont),
          queryParameters: {"id": pageI},
          options: Options(headers: headerBearerOption(token)));
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final notFound = response.data["detail"];
      if (notFound != null) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final json = (response.data);
      final song = SongModel.fromJson(json);
      return song;
    } on DioException catch (e) {
      throw DioException(
          error: e.error,
          requestOptions: e.requestOptions,
          stackTrace: e.stackTrace,
          message: e.message,
          type: e.type);
    } on ApiException catch (e) {
      throw ApiException(
          failure: e.failure, message: e.message, status: e.status);
    }
  }

  @override
  Future<String> like({required num songId}) async {
    try {
      final response = await _cleint.post(
          endpoint(SongOfMemeDataSource.likePiont),
          data: {"song_id": songId},
          options: Options(headers: headerBearerOption(token)));
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final status = (response.data["status"]);
      return status;
    } on DioException catch (e) {
      throw DioException(
          error: e.error,
          requestOptions: e.requestOptions,
          stackTrace: e.stackTrace,
          message: e.message,
          type: e.type);
    } on ApiException catch (e) {
      throw ApiException(
          failure: e.failure, message: e.message, status: e.status);
    }
  }

  @override
  Future<String> view({required num songId}) {
    // TODO: implement view
    throw UnimplementedError();
  }

  Future<bool> getLikesByUser(num songId) async {
    return true;
    try {
      final response = await _cleint.post(
          endpoint(SongOfMemeDataSource.likePiont),
          data: {"song_id": songId},
          options: Options(headers: headerBearerOption(token)));
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data["detail"]),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final status = (response.data["status"]) as String;
      return status.toLowerCase().startsWith("a");
    } on DioException catch (e) {
      throw DioException(
          error: e.error,
          requestOptions: e.requestOptions,
          stackTrace: e.stackTrace,
          message: e.message,
          type: e.type);
    } on ApiException catch (e) {
      throw ApiException(
          failure: e.failure, message: e.message, status: e.status);
    }
  }

  @override
  Future<void> downloadSong({required String url}) async {
    // TODO
    throw UnimplementedError();
  }
}
