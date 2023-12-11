
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {

  final googleSignIn = GoogleSignIn();
  bool _isSigningIn = false;
  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future<void> login() async {
    isSigningIn = true;
    try {
      final user = await googleSignIn.signIn();
      if (user == null) {
        isSigningIn = false;
        return;
      } else {
        final googleAuth = await user.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        isSigningIn = false;
      }
    } catch (e) {
      print('Error signing in with Google: ${e.toString()}');
      isSigningIn = false;
    }
  }

  void logout() async {
    try {
      await googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error during logout: ${e.toString()}');
    }
  }
}

