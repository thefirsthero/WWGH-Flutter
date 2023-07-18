import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:guest_house_app/firebase_options.dart';

class AuthService {
 
 

  Future<bool?> authState() async {
  
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      
    );
    bool isLoggedIn = false;

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
    });
    return isLoggedIn;
  }
  

  Future<void> googleLogin(Function erorCallback) async {
   
  }
  //Future<void> 
}
