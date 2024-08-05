import 'package:flutter/material.dart';
import 'package:song_of_meme/src/core/extentions/util_extentions.dart';

class Success<T> extends StatelessWidget {
  Success(
      {super.key,
      required this.data,
      this.shrinkwrap = false,
      this.singleChild,
      required this.childBuilder,
      required this.noData});
  final List<T> data;
  final Widget? Function(BuildContext, int) childBuilder;
  final String noData;
  bool shrinkwrap;
  Widget? singleChild;
  @override
  Widget build(BuildContext context) {
    return !(singleChild != null)
        ? data.isNotEmpty
            ? shrinkwrap
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: childBuilder)
                : Expanded(
                    child: ListView.builder(
                        itemCount: data.length, itemBuilder: childBuilder))
            : Center(
                child: noData.text(),
              )
        : singleChild ?? const SizedBox();
  }
}
