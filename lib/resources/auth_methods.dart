import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // userSignup
  Future<String> signupUser({
    required String email,
    required String password,
    required String phone,
    required String username,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          phone.isNotEmpty ||
          username.isNotEmpty) {
        // register user
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //add user details
        await _firestore.collection("users").doc(userCred.user!.uid).set({
          "username": username,
          "uid": userCred.user!.uid,
          "email": email,
          "phone": phone,
          "followers": [],
          "following": [],
        });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
