import 'package:flutter/material.dart';
import 'package:squad/core/auth/google_sign_in.dart';
import 'package:squad/widgets/lottie_custom.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (currentUserFromInit == null) {
          Navigator.of(context).pushReplacementNamed("/authentication");
        } else {
          Navigator.of(context).pushReplacementNamed("/home");
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LottieCustomWidget(path: "car"),
      ),
    );
  }
}
