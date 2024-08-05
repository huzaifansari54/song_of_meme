import 'package:dio/dio.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/features/auth/data/data_source/data_source_repository.dart';
import 'package:song_of_meme/src/features/auth/data/data_source/local/local_data_source.dart';
import 'package:song_of_meme/src/features/auth/data/model/auth_model.dart';
import 'package:song_of_meme/src/features/auth/domain/entity/auth_entity.dart';
import 'package:song_of_meme/src/features/auth/domain/repository/repository.dart';

import '../../../../core/exeption/dio_exception.dart';
import '../../../../core/exeption/exceptions.dart';

class AuthRepository implements IAuthRepository {
  final IAuthDataSaurceRepository _dataSaurceRepository;
  final ILocalDataSorce _localDataSorce;
  AuthRepository(this._localDataSorce,
      {required IAuthDataSaurceRepository dataSaurceRepository})
      : _dataSaurceRepository = dataSaurceRepository;
  @override
  TaskEither<ApiFailure, AuthEntity> googleSignUp(
      {required String email, required String password, required String name}) {
    // TODO: implement googgleSignUp
    throw UnimplementedError();
  }

  @override
  TaskEither<ApiFailure, AuthEntity> logIn(
      {required String email, required String password}) {
    return TaskEither.tryCatch(
            () => _dataSaurceRepository.logIn(email: email, password: password),
            (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return error.failure!;
    })
        .flatMap((user) =>
            TaskEither.tryCatch(() => _localDataSorce.saveUser(user), (e, __) {
              if (e is DioException) {
                return dioErrorHandler(e);
              }
              final error = e as ApiException;
              return error.failure!;
            }))
        .map((model) => model.toEntity());
  }

  @override
  TaskEither<ApiFailure, AuthEntity> singUp(
      {required String email, required String password, required String name}) {
    return TaskEither.tryCatch(
            () => _dataSaurceRepository.singUp(
                email: email, password: password, name: name), (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return error.failure!;
    })
        .flatMap((user) =>
            TaskEither.tryCatch(() => _localDataSorce.saveUser(user), (e, __) {
              if (e is DioException) {
                return dioErrorHandler(e);
              }
              final error = e as ApiException;
              return error.failure!;
            }))
        .map((model) => model.toEntity());
  }

  @override
  Future<bool> currentUser() async {
    final token = _localDataSorce.getUserToken();
    if (token.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  TaskEither<ApiFailure, Unit> logOut(
      {required String email, required String password, required String name}) {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  TaskEither<ApiFailure, AuthEntity> user() {
    return TaskEither.tryCatch(() => Future.value(_localDataSorce.getUser()),
        (e, __) {
      if (e is DioException) {
        return dioErrorHandler(e);
      }
      final error = e as ApiException;
      return error.failure!;
    }).map((model) => model.toEntity());
  }
}
