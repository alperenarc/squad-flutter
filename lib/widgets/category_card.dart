import 'package:flutter/material.dart';

import '../constants.dart';


class CategoryCard extends StatelessWidget {
  final IconData icon;
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
                  Icon(
                    icon,
                    color: kActiveIconColor,
                    size: 80.0,
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15,color:kTextColor),
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
