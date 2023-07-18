import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:guest_house_app/models/user.dart';
import 'package:guest_house_app/services/firestoreServices.dart';

class UserProvider with ChangeNotifier {
  //TODO
  late User _user;

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  Future<void> isUserExists() async {
    var userAuth = await auth.FirebaseAuth.instance.currentUser;
    CollectionReference<Map<dynamic, dynamic>> usersRef =
        await FirebaseFirestore.instance.collection('users');
    User newUser = User(
        bookings: [],
        guests: [],
        userId: userAuth!.uid,
        email: userAuth.email!,
        userName: userAuth.displayName,
        image : userAuth.photoURL);
        _user = newUser;

    await usersRef.doc(userAuth.uid).get().then((snapshots) => {
          if (snapshots.exists)
            {
              _user = User.fromJson(snapshots.data() as Map<String, dynamic>
                ..['userId'] = snapshots.id
                ..['userName'] = userAuth.displayName
                ..['image'] = userAuth.photoURL)
            }
          else
            {usersRef.doc(userAuth.uid).set(newUser.toJson())}
        });

    notifyListeners();
  }
}
