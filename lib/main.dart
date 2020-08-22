import 'package:flutter/material.dart';
import 'package:squad/screens/managed_squads_screen/managed_squads.dart';

import 'screens/authentication/authentication.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'screens/squad_details_screen/squad_details.dart';
import 'screens/tabs_screen/route.dart';
import 'screens/your_squads_screen/your_squads.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Squad';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: _title,
      initialRoute: "/",
      routes: {
        '/': (ctx) => SplashScreen(),
        '/home': (ctx) => TabsScreen(),
        '/authentication': (ctx) => AuthenticationScreen(),
        '/your_squads': (ctx) => YourSquads(),
        '/managed_squads': (ctx) => ManagedSquads(),
        '/squad_details' : (ctx) => SquadDetails(),
      },
    );
  }
}
