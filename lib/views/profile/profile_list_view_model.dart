import 'package:flutter/material.dart';
import 'package:squad/core/auth/google_sign_in.dart';
import 'package:squad/views/profile/profile_list.dart';

abstract class ProfileListViewModel extends State<ProfileList> {
  bool isLoading = false;
  var user;

  @override
  void initState() {
    super.initState();
    initializer();
    // print(authService.isLoggedIn);
    // user = auth.currentUser();

    // userName = user.displayName;
    // initializer();
  }

  void initializer() async {
    await auth.currentUser().then((value) {
      setState(() {
        user = value;
        print(user.displayName);
        isLoading = true;
      });
    });
  }

  void googleSignOut() async {
    signOutGoogle();
    Navigator.of(context).pushReplacementNamed("/authentication");
    // .then(
    //   (_) {
    //     Navigator.of(context).pushReplacementNamed("/authentication");
    //   },
    // );
  }
}
