import 'package:flutter/material.dart';
import 'package:squad/core/auth/google_sign_in.dart';

import 'authentication_list.dart';

abstract class AuthenticationListViewModel extends State<AuthenticationList> {
  // AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    // print(auth.currentUser());
  }

  Future<void> googleSignIn() async {
    var user = await signInWithGoogle();
    if (user != null) {
      Navigator.of(context).pushReplacementNamed("/home");
    }
  }
}
