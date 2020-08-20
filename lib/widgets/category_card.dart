import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final Function press;
  final Size size;
  const CategoryCard({Key key, this.icon, this.title, this.press, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        height: size.height * .2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  // Icon(
                  //   icon,
                  //   color: kActiveIconColor,
                  //   size: 80.0,
                  // ),
                  Container(
                    width:150,
                    height:100,
                    child: SvgPicture.asset("assets/illustrations/$icon.svg"),
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15, color: kTextColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
