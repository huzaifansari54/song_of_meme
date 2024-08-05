import 'package:fpdart/fpdart.dart';
import 'package:song_of_meme/src/features/auth/domain/entity/auth_entity.dart';

import '../../../../core/exeption/failure_model.dart';

typedef Token = String;

abstract interface class IAuthRepository {
  TaskEither<ApiFailure, AuthEntity> logIn(
      {required String email, required String password});
  TaskEither<ApiFailure, AuthEntity> singUp(
      {required String email, required String password, required String name});
  TaskEither<ApiFailure, AuthEntity> googleSignUp(
      {required String email, required String password, required String name});
  Future<bool> currentUser();
  TaskEither<ApiFailure, AuthEntity> user();
  TaskEither<ApiFailure, Unit> logOut(
      {required String email, required String password, required String name});
}
