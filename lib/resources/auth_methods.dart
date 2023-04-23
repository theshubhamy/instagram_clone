import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usocial/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // userSignup
  Future<String> signupUser({
    required String email,
    required String password,
    required String phone,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          phone.isNotEmpty ||
          username.isNotEmpty ||
          file.isNotEmpty) {
        // register user
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        // file upload
        String photoUrl =
            await StorageMethods().uploadImage('profilePics', file, false);
        //add user details
        await _firestore.collection("users").doc(userCred.user!.uid).set({
          "username": username,
          "uid": userCred.user!.uid,
          "email": email,
          "phone": phone,
          "followers": [],
          "following": [],
          'photoUrl': photoUrl,
        });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
