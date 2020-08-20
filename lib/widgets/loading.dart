import 'package:flutter/material.dart';
import '../constants.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(kBlueLightColor),
        ),
        height: 20.0,
        width: 20.0,
      ),
    );
  }
}
