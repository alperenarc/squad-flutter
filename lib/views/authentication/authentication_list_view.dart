import 'package:flutter/material.dart';
import '../../constants.dart';
import 'authentication_list_view_model.dart';

class AuthenticationListView extends AuthenticationListViewModel {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print(user);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 150),
                      // Image.network(
                      //   'https://img.pngio.com/fedorroxs-squad-playlist-1080p-videos-squad-forums-squad-png-500_221.png',
                      // ),
                      Image.asset('assets/images/logo.png'),
                      SizedBox(height: 100),
                      InkWell(
                        onTap: () async {
                          await googleSignIn();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          decoration: BoxDecoration(
                            color: kBlueLightColor,
                            borderRadius: BorderRadius.circular(29.5),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Google ile giriş yap',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Widget _signInButton() {
  //   return OutlineButton(
  //     splashColor: Colors.grey,
  //     onPressed: () {
  //       signInWithGoogle().whenComplete(() {
  //         Navigator.of(context).push(
  //           MaterialPageRoute(
  //             builder: (context) {
  //               return FirstScreen();
  //             },
  //           ),
  //         );
  //       });
  //     },
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  //     highlightElevation: 0,
  //     borderSide: BorderSide(color: Colors.grey),
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 10),
  //             child: Text(
  //               'Sign in with Google',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.grey,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
