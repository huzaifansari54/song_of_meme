import 'dart:async';

import 'package:song_of_meme/src/features/auth/data/model/auth_model.dart';

import '../../domain/repository/repository.dart';

abstract interface class IAuthDataSaurceRepository {
  Future<AuthModel> logIn({required String email, required String password});
  Future<AuthModel> singUp(
      {required String email, required String password, required String name});
  Future<AuthModel> googleSignUp(
      {required String email, required String password, required String name});
}
