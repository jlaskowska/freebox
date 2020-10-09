import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:freebox/modules/authentification/authtentification.dart';

class AuthService implements IAuthService {
  @override
  Future<void> signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
