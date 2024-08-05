import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';

import '../exeption/failure_model.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key, required this.failure});
  // final ApiFailure failure;
  final ApiFailure failure;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: failure.when(
        serverFailed: (s) => s.text(),
        timeout: () => "Time Out".text(),
        invalidToken: () => "Invalid Token".text(),
        internetOut: () => "Internet is Not connected".text(),
      ),
    );
  }
}
