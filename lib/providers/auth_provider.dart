
import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:guest_house_app/firebase_options.dart';
import 'package:provider/provider.dart';           // new
enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}
  

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    init();
  }

  Future<void> init() async {
     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    
    

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
        print(true);
        print(user.displayName);
        print(user.email);
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        print(false);
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;



  Future<void> googleSign()async{
     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(authCredential);


    } on FirebaseAuthException catch (e) {
      //TODO handle the google sign
      

    }
    notifyListeners();
  }

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> signout() async {
     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(    
    );
    await FirebaseAuth.instance.signOut();
    _loginState = ApplicationLoginState.loggedOut;
    await GoogleSignIn().signOut();
    notifyListeners();
  }

  Future<void> verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

 

  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(String e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
      _loginState =ApplicationLoginState.loggedIn;

    } on FirebaseAuthException catch (e) {
      errorCallback(e.code);
    }
    notifyListeners();
  }

  
}