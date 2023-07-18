// import 'package:guest_house_app/models/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';

// class UserSharedPreferences {
//   Future<bool> saveUser(User user) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("userId", user.userId);
//     prefs.setString("email", user.email);
//     prefs.setStringList("bookings", user.bookings);
//     prefs.setStringList("guests", user.guests);
//     prefs.setString("token", user.token);
//     return prefs.containsKey("userId");
//   }

//   Future<User?> getUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (!prefs.containsKey("userId")){
//       return null;
//     }
//     String userId = prefs.getString("userId")?? "";
//     //TODO
//     String email = prefs.getString("email") ?? "";
//     List<String> bookings = prefs.getStringList("bookings") ?? [];
//     List<String> guests = prefs.getStringList("guests") ?? [];
//     String token = prefs.getString('token') ?? "";
//     return User(
//         userId: userId,
//         email: email,
//         bookings: bookings,
//         guests: guests,
//         token: token);
//   }

//   Future<void> removeUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove("userId");
//     prefs.remove("email");
//     prefs.remove("bookings");
//     prefs.remove("token");
//     prefs.remove("guests");
//   }

//   Future<String> getToken(args) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString("token") ?? "";
//     return token;
//   }
// }
