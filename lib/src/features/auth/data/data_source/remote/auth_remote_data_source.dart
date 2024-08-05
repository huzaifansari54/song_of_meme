import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/auth/data/data_source/data_source_repository.dart';
import 'package:song_of_meme/src/features/auth/domain/repository/repository.dart';

import '../../../../../core/exeption/dio_exception.dart';
import '../../../../../core/exeption/exceptions.dart';
import '../../model/auth_model.dart';

class AuthRemoteDataSource implements IAuthDataSaurceRepository {
  final Dio _dio;
  static const loginPoint = "login";
  static const signUpPoint = "signup";

  AuthRemoteDataSource({required Dio dio}) : _dio = dio;
  @override
  Future<AuthModel> googleSignUp(
      {required String email, required String password, required String name}) {
    // TODO: implement googgleSignUp
    throw UnimplementedError();
  }

  @override
  Future<AuthModel> logIn(
      {required String email, required String password}) async {
    try {
      final response =
          await _dio.post(endpoint(AuthRemoteDataSource.loginPoint));
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data.toString()),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final toke = (response.data["access_token"]);
      return AuthModel(profile_url: "", id: toke, name: "", email: email);
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
  Future<AuthModel> singUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final response =
          await _dio.post(endpoint(AuthRemoteDataSource.signUpPoint), data: {
        "name": name,
        "email": email,
        "password": password,
      });
      if (!response.ok) {
        throw ApiException(
            failure: ApiFailure.serverFailed(message: response.data.toString()),
            message: response.statusMessage!,
            status: response.statusCode.toString());
      }
      final toke = (response.data["access_token"]);
      return AuthModel(profile_url: "", id: toke, name: name, email: email);
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
}
