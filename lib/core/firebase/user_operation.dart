import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:squad/core/auth/google_sign_in.dart';

final firestoreInstance = Firestore.instance;
final users = firestoreInstance.collection("users");
var squads =[];

// @route   getCurrentUserInfo
// @desc    fetches current user's information
// @access  Public
Future<dynamic> getCurrentUserInfo() async {
  var currentUser;
  currentUser = await auth.currentUser();
  return currentUser;
}

// @route   getMySquads
// @desc    fetches current user's squads
// @access  Public
Future<void> getMySquads() async {
  squads =[];
  var user = await getCurrentUserInfo();

  await users
      .document(user.uid)
      .collection("squads")
      .getDocuments()
      .then((querySnapshot) {
    querySnapshot.documents.forEach((result) {
      squads.add(result);
    });
  }).then((value) {
    print(squads);
  });
  
}
