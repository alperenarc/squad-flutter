import 'package:flutter/material.dart';

import 'screens/authentication/authentication.dart';
import 'screens/splash_screen/splash_screen.dart';
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
        '/your_squads': (ctx) => YourSquads()
      },
    );
  }
}
