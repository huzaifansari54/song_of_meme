import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
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
