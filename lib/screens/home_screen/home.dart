import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:squad/screens/your_squads_screen/your_squads.dart';
import 'package:squad/widgets/category_card.dart';
import 'package:squad/widgets/search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: <Widget>[
          backgroundShape(size),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  roundedShape(),
                  welcomeText(context),
                  SearchBar(),
                  SizedBox(height: 40),
                  gridViewList(size),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container backgroundShape(Size size) {
    return Container(
      height: size.height * .45,
      decoration: BoxDecoration(
        color: Color(0xFFF5CEB8),
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
        ),
      ),
    );
  }

  Align roundedShape() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        alignment: Alignment.center,
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          color: Color(0xFFF2BEA1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Text welcomeText(BuildContext context) {
    return Text(
      "Squad'a \nHoşgeldiniz",
      style: Theme.of(context)
          .textTheme
          .headline4
          .copyWith(fontWeight: FontWeight.w900),
    );
  }

  Expanded gridViewList(Size size) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .85,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: <Widget>[
          OpenContainer(
            closedElevation: 7,
            openElevation: 0,
            closedBuilder: (context, action) => CategoryCard(
              size: size,
              title: "Ekiplerin",
              icon: 'team',
              press: () {
                Navigator.of(context).pushReplacementNamed("/your_squads");
              },
            ),
            openBuilder: (context, action) => YourSquads(),
          ),
          OpenContainer(
            closedElevation: 7,
            openElevation: 0,
            closedBuilder: (context, action) => CategoryCard(
              size: size,
              title: "Yönetilen Ekipler",
              icon: 'admin',
              press: () {
                Navigator.of(context).pushReplacementNamed("/managed_squads");
              },
            ),
            openBuilder: (context, action) => YourSquads(),
          ),
        ],
      ),
    );
  }
}
