import 'package:flutter/material.dart';
import 'package:squad/screens/home_screen/home.dart';
import 'package:squad/screens/profile_screen/profile.dart';

import '../../constants.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [
    {
      'page': StaticClass(),
      'title': 'Etkinlikler',
    },
    {
      'page': Home(),
      'title': 'Anasayfa',
    },
    {
      'page': Profile(),
      'title': 'Profil',
    }
  ];
  int _selectedPageIndex = 1;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedPageIndex]['title']),
      // ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: kBlueColor,
        selectedItemColor: kActiveIconColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.event),
            title: Text("Etkinlikler"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
            title: Text("Anasayfa"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.supervised_user_circle),
            title: Text("Profil"),
          ),
        ],
      ),
    );
  }
}


class StaticClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text('alperen ')
    );
  }
}