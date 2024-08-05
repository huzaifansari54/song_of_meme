import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';

import 'package:song_of_meme/src/features/auth/data/model/auth_model.dart';

import '../../../../../core/exeption/failure_model.dart';
part 'auth_sate.freezed.dart';

@freezed
abstract class AuthSate with _$AuthSate {
  const AuthSate._();
  const factory AuthSate(
      {required AuthModel authModel,
      required String email,
      required String name,
      required String password,
      required bool isLoading,
      required bool isLogin,
      required ApiFailure? failure}) = _AuthSate;
  factory AuthSate.init() => AuthSate(
      password: "",
      isLogin: false,
      name: "",
      email: "",
      authModel: AuthModel.empty(),
      isLoading: false,
      failure: null);

  bool get validateEamilPassword =>
      validateEmail(email).and(password.isNotEmpty);
  bool get emailValidate => validateEmail(email);
  bool get validateAll => validateEamilPassword.and(name.isNotEmpty);
}
