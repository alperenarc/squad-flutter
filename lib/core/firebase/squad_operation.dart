import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:squad/core/auth/google_sign_in.dart';

final firestoreInstance = Firestore.instance;
final squads = firestoreInstance.collection("squads");
final users = firestoreInstance.collection("users");
var managedSquadsRequestsFromFirebase = [];

// @route   getCurrentUserInfo
// @desc    fetches current user's information
// @access  Public
Future<dynamic> getCurrentUserInfo() async {
  var currentUser;
  currentUser = await auth.currentUser();
  return currentUser;
}

// @route   createSquad
// @desc    Create a new Squad
// @access  Public
Future<bool> createSquad(squadName) async {
  //Get current user uid
  var user = await getCurrentUserInfo();

  // Unique Squad Name Check
  bool isExist = await checkSquadExist(squadName);

  if (isExist) {
    //Create squad
    squads.add({
      "name": squadName,
      "adminUid": user.uid,
      "createDate": DateTime.now()
    }).then((value) {
      print(value.documentID);
      squads
          .document(value.documentID)
          .collection("members")
          .document(user.uid)
          .setData({
        "username": user.displayName,
        "photoUrl": user.photoUrl,
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
  var user = await getCurrentUserInfo();

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
              .document(user.uid)
              .setData({
            "username": user.displayName,
            "photoUrl": user.photoUrl,
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
  var user = await getCurrentUserInfo();

  //Find the user and add to their information
  try {
    await users
        .document(user.uid)
        .collection("squads")
        .document(squadID)
        .setData({
      "squadName": squadName,
      "state": state,
      "joinedDate": DateTime.now()
    });
    return true;
  } catch (e) {
    return false;
  }
}

// @route   getMyManagedSquads
// @desc    fetches current user's managed squads requests
// @access  Public

var managedSquads = [];

Future<dynamic> getMyManagedSquads() async {
  managedSquads = [];
  var user = await getCurrentUserInfo();
  await squads
      .where("adminUid", isEqualTo: user.uid)
      .getDocuments()
      .then((querySnapshot) {
    querySnapshot.documents.forEach((res) async {
      managedSquads.add(res);
    });
  });
  return managedSquads;
}

var managedSquadsList = [];

Future<dynamic> getMyManagedSquadsList() async {
  managedSquadsList = [];
  managedSquadsRequestsFromFirebase = [];
  managedSquadsList = await getMyManagedSquads();
  for (var item in managedSquadsList) {
    await squads
        .document(item.documentID)
        .collection("members")
        .where("isAccepted", isEqualTo: false)
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        managedSquadsRequestsFromFirebase.add(
          {
            "squadName": item.data['name'],
            "userUid": result.documentID,
            "userInfo": result.data,
          },
        );
      });
    });
  }

  return managedSquadsRequestsFromFirebase;
}

Future<void> changeUserAcceptedState(squadUid, userUid, state) async {
  await squads
      .document(squadUid)
      .collection('members')
      .document(userUid)
      .updateData({"isAccepted": state}).then((_) {
    print("Operation succeeded!");
  });
}

Future<void> deleteUserFromRequest(squadUid, userUid) async {
  await squads
      .document(squadUid)
      .collection('members')
      .document(userUid)
      .delete()
      .then((value) {
    print('user deleted from request');
  });
}

Future<void> acceptUser(userUid, squadName) async {
  // önce squads tarafını true yap sonra user tarafını true yap

  await squads
      .where("name", isEqualTo: squadName)
      .getDocuments()
      .then((querySnapshot) {
    querySnapshot.documents.forEach((result) async {
      await changeUserAcceptedState(result.documentID, userUid, true);
    });
  });
}

Future<void> declineUser(userUid, squadName) async {
  await squads
      .where("name", isEqualTo: squadName)
      .getDocuments()
      .then((querySnapshot) {
    querySnapshot.documents.forEach((result) async {
      await deleteUserFromRequest(result.documentID, userUid);
    });
  });
}
