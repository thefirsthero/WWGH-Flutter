

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guest_house_app/models/user.dart';
class FirestoreServices {

 final usersRef = FirebaseFirestore.instance
    .collection('users')
    .withConverter<User>(
      fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!..['userId'] = snapshots.id),
      toFirestore: (user, _) => user.toJson(),
    );
  
}