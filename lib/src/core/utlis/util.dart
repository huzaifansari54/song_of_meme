import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:song_of_meme/src/core/exeption/dio_exception.dart';
import 'package:song_of_meme/src/core/exeption/exceptions.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';

import '../constant/string_const.dart';

typedef DataMap = Map<String, dynamic>;

String endpoint(String point) => Uri.parse(baseUrl + point).toString();
Map<String, String> headerBearerOption(String token) => {
      'Accepts': 'application/json',
      'Authorization': "Bearer $token",
    };

abstract class UseCase<Param, Type> {
  const UseCase();
  TaskEither<ApiFailure, Type> call({required Param param});
}

bool validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value) ? false : true;
}

showError(ApiFailure fail, BuildContext context) {
  return fail.when(serverFailed: (s) {
    context.snackbar(s);
  }, timeout: () {
    context.snackbar("request TimeOut");
  }, internetOut: () {
    context.snackbar("InternetOut");
  }, invalidToken: () {
    context.snackbar("token failed");
  });
}

class Downloader {
  Downloader({required Dio dio, required Directory directory})
      : _dio = dio,
        _directory = directory;
  final Dio _dio;
  Map<String, File> get cache => _cacheMap;
  final Directory _directory;
  final Map<String, File> _cacheMap = {};
  Future<Either<ApiFailure, Unit>> downloadSong(
      String url, void Function(int, int)? onReceiveProgress) async {
    final permissio = await Permission.storage.request();
    if (permissio.isGranted) {
      try {
        if (!_cacheMap.containsKey(url)) {
          final file =
              File('${_directory.path}${Uri.parse(url).pathSegments.last}');
          final body = await _dio.get(url,
              onReceiveProgress: onReceiveProgress,
              options: Options(responseType: ResponseType.bytes));

          final data = body.data;
          file.writeAsBytesSync(data);
          _cacheMap[url] = file;
          return right(unit);
        } else {
          return right(unit);
        }
      } on FileSystemException catch (error) {
        return left(ApiFailure.internetOut());
      } on DioException catch (e) {
        throw ApiException(
            failure: dioErrorHandler(e),
            message: e.message!,
            status: e.message!);
      } on Exception catch (error) {
        return left(ApiFailure.serverFailed(message: "give as permission"));
      }
    } else {
      await openAppSettings();
      return left(ApiFailure.serverFailed(message: "give as permission"));
    }
  }
}
