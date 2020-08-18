import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:squad/core/auth/google_sign_in.dart';

final firestoreInstance = Firestore.instance;
final squads = firestoreInstance.collection("squads");
final users = firestoreInstance.collection("users");

// @route   createSquad
// @desc    Create a new Squad
// @access  Public
Future<bool> createSquad(squadName) async {
  //Get current user uid
  var currentUserUid;
  var currentUser;
  currentUser = await auth.currentUser();
  currentUserUid = currentUser.uid;

  // Unique Squad Name Check
  bool isExist = await checkSquadExist(squadName);

  if (isExist) {
    //Create squad
    squads.add({
      "name": squadName,
      "adminUid": currentUserUid,
      "createDate": DateTime.now()
    }).then((value) {
      print(value.documentID);
      squads
          .document(value.documentID)
          .collection("members")
          .document(currentUserUid)
          .setData({
        "username": currentUser.displayName,
        "photoUrl": currentUser.photoUrl,
        "isAccepted": true
      });
      addSquadToUserDoc(value.documentID, squadName, true);
    });
  } else {
    return isExist;
  }

  return isExist;
}

Future<bool> checkSquadExist(squadName) async {
  var isExist = false;
  await squads.where("name", isEqualTo: squadName).getDocuments().then(
    (value) {
      if (value.documents.isEmpty) {
        isExist = true;
        print('squad Yok $isExist');
      }
    },
  );
  print('squad var $isExist');
  return isExist;
}

// @route   joinSquad
// @desc    Join a squad
// @access  Public

Future<bool> joinSquad(squadName) async {
  //Get current user uid
  var currentUserUid;
  var currentUser;
  currentUser = await auth.currentUser();
  currentUserUid = currentUser.uid;

  // Find Squad
  bool isExist = await checkSquadExist(squadName);
  print(isExist);
  // if isExist equals to false, there is a squad.

  if (!isExist) {
    await squads.where("name", isEqualTo: squadName).getDocuments().then(
      (value) {
        value.documents.forEach((element) {
          squads
              .document(element.documentID)
              .collection("members")
              .document(currentUserUid)
              .setData({
            "username": currentUser.displayName,
            "photoUrl": currentUser.photoUrl,
            "isAccepted": false
          });
          addSquadToUserDoc(element.documentID, squadName, false);
        });
      },
    );
  } else {
    return !isExist;
  }

  return !isExist;
}

// @route   addSquadToUserDoc
// @desc    Adds the team name to the user's information.
// @access  Public

Future<bool> addSquadToUserDoc(squadID, squadName, state) async {
  //Get current user uid
  var currentUserUid;
  var currentUser;
  currentUser = await auth.currentUser();
  currentUserUid = currentUser.uid;

  //Find the user and add to their information
  try {
    await users
        .document(currentUserUid)
        .collection("squads")
        .document(squadID)
        .setData({
      "squadName": squadName,
      "state": state,
      "joinedDate":DateTime.now()
    });
    return true;
  } catch (e) {
    return false;
  }
}
