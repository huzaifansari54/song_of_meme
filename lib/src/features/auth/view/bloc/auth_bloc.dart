import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:song_of_meme/main.dart';
import 'package:song_of_meme/src/core/exeption/failure_model.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';
import 'package:song_of_meme/src/core/utlis/util.dart';
import 'package:song_of_meme/src/features/auth/data/model/auth_model.dart';
import 'package:song_of_meme/src/features/auth/domain/entity/auth_entity.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/is_user_login_use_case.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:song_of_meme/src/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:song_of_meme/src/features/auth/view/bloc/state/auth_sate.dart';
import '../../../../lc.dart';

final authBloc = StateNotifierProvider<AuthBloc, AuthSate>(
    (_) => AuthBloc(lc(), lc(), lc()));

class AuthBloc extends StateNotifier<AuthSate> {
  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;
  final IsUserLogInUseCase _userLogInUseCase;

  AuthBloc(this._loginUseCase, this._signUpUseCase, this._userLogInUseCase)
      : super(AuthSate.init()) {
    state = state.copyWith(isLoading: true);
    _userLogInUseCase(param: NoParm()).run().then((auth) => auth
        .filterOrElse(
            (s) => s.email.isNotEmpty, (_) => const ApiFailure.invalidToken())
        .match(
            (fail) => state = state.copyWith(isLoading: false, isLogin: false),
            (user) => state = state.copyWith(
                isLoading: false, isLogin: true, authModel: user)));
  }

  setEmail(String email) => state = state.copyWith(email: email);
  setName(String name) => state = state.copyWith(name: name);
  setPassword(String password) => state = state.copyWith(password: password);

  login(BuildContext context) async {
    if (state.emailValidate) {
      context.snackbar("wrong email ");
      return;
    }
    if (!state.validateEamilPassword) {
      context.snackbar("Fill Email And Password");
      return;
    }

    state = state.copyWith(isLoading: true);
    final resultOrFail = await _loginUseCase(
            param: LoginParm(password: state.password, email: state.email))
        .run();

    resultOrFail.map((user) => user.toModel()).match((fail) {
      state = state.copyWith(isLoading: false, failure: fail);
      showError(fail, context);
    }, (user) {
      state = state.copyWith(isLoading: false, authModel: user);
      context.goTo(HomeScree(user: user));
    });
  }

  signUp(BuildContext context) async {
    if (!state.emailValidate) {
      context.snackbar("wrong email");
      return;
    }

    if (!state.validateAll) {
      context.snackbar("Fill Email, Password And Name");

      return;
    }
    state = state.copyWith(isLoading: true);
    final resultOrFail = await _signUpUseCase(
            param: SignUpParm(
                name: state.name, email: state.email, password: state.password))
        .run();

    resultOrFail.map((user) => user.toModel()).match((fail) {
      state = state.copyWith(isLoading: false, failure: fail);
      showError(fail, context);
    }, (user) {
      state = state.copyWith(isLoading: false, authModel: user);
      context.goTo(HomeScree(user: user));
    });
  }
}
