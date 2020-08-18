import 'package:flutter/material.dart';

import '../constants.dart';

class OpacityButton extends StatelessWidget {
  final Function function;
  final String title;

  const OpacityButton({Key key, this.function, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
          color: kActiveIconColor,
          borderRadius: BorderRadius.circular(29.5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: kTextColor),
          ),
        ),
      ),
    );
  }
}