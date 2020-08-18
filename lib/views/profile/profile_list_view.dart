import 'package:flutter/material.dart';
import 'package:squad/views/profile/profile_list_view_model.dart';
import '../../core/auth/google_sign_in.dart';
import '../../constants.dart';

class ProfileListView extends ProfileListViewModel {
  @override
  Widget build(BuildContext context) {
    print(currentUserFromInit);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
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
                      Image.asset('assets/images/logo.png'),
                      Center(
                        child: isLoading
                            ? CircleAvatar(
                                radius: 50.0,
                                backgroundImage:
                                    NetworkImage('${user.photoUrl}'),
                                backgroundColor: Colors.transparent,
                              )
                            : Text('Yükleniyor...'),
                      ),
                      SizedBox(height: 20),
                      isLoading
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${user.email}',
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  '${user.displayName}',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            )
                          : Text('Yükleniyor...'),
                      SizedBox(height: 50),
                      InkWell(
                        onTap: () async {
                          googleSignOut();
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
                              'Çıkış Yap',
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
}
