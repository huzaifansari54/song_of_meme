import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constant/colors_const.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: greenColor),
    );
  }
}
