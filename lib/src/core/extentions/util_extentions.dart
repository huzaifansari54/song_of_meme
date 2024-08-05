import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constant/colors_const.dart';

extension TextEx on String {
  bool get isNum => num.tryParse(this) != null;
  Text text(
      {double? size,
      Color? color,
      TextAlign? align,
      FontWeight? fontWeight,
      bool crossline = false}) {
    return Text(
      this,
      maxLines: 5,
      softWrap: true,
      style: const TextStyle().copyWith(
          decoration: crossline ? TextDecoration.lineThrough : null,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: size ?? 12,
          color: color ?? secondBlackColor),
      textAlign: align ?? TextAlign.left,
    );
  }
}

extension BuildCtxEx on BuildContext {
  goTo(Widget screen) =>
      Navigator.push(this, MaterialPageRoute(builder: (_) => screen));

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbar(
      String content) {
    final s = ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              content,
              style: const TextStyle(
                  color: greenColor, fontSize: 16.0, fontFamily: 'OPTIMA'),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: greenColor, width: 2.0),
      ),
    ));

    return s;
  }
}

extension buildCtx on BuildContext {}

extension BoxEx on num {
  SizedBox get sw => SizedBox(width: toDouble());
  SizedBox get sh => SizedBox(height: toDouble());
}

extension Boolx on bool {
  bool and(bool condition) => this && condition;
  bool or(bool condition) => this || condition;
  bool get toogle => !this;
  bool get isNot => !this;
}

extension ResponseEx on Response {
  bool get ok => statusCode == 200;
}
