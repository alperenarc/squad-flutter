// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseUser user;
//   GoogleSignIn _googleSignIn = new GoogleSignIn();
//   bool isLoggedIn = false;

//   Future<FirebaseUser> handleSignIn() async {
//     GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
//     GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     AuthCredential credential = GoogleAuthProvider.getCredential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);

//     AuthResult result = (await auth.signInWithCredential(credential));

//     user = result.user;
//     // print(user.photoUrl);
//     isLoggedIn = true;
//     return user;
//   }

//   Future<void> googleSignOut() async {
//     await auth.signOut().then(
//       (onValue) {
//         _googleSignIn.signOut();
//       },
//     );
//   }
// }
// final AuthService authService = AuthService();

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;

FirebaseUser currentUserFromInit;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await auth.signInWithCredential(credential);
  FirebaseUser user = authResult.user;

  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  // Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await auth.signOut().then((value) {
    googleSignIn.signOut();
  });

  print("User Sign Out");
}

Future<void> getCurrentUser() async {
  currentUserFromInit = await auth.currentUser();
}
