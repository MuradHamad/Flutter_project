import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
