import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieCustomWidget extends StatelessWidget {
  final String path;

  LottieCustomWidget({Key key, @required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Lottie.asset("assets/lottie/$path.json"),
    );
  }
}
