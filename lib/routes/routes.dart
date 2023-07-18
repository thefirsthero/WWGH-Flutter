

import 'package:flutter/cupertino.dart';
import 'package:guest_house_app/screens/forgotpassword_screen.dart';
import 'package:guest_house_app/screens/home_screen.dart';
import 'package:guest_house_app/screens/listing_ac_rooms.dart';
import 'package:guest_house_app/screens/listing_non_ac_rooms.dart';
import 'package:guest_house_app/screens/listing_rooms_screen.dart';
import 'package:guest_house_app/screens/main_screen.dart';
import 'package:guest_house_app/screens/login_screen.dart';
import 'package:guest_house_app/screens/room_screen.dart';
import 'package:guest_house_app/screens/signup_screen.dart';
import 'package:guest_house_app/screens/splash_screen.dart';
import 'package:guest_house_app/screens/verification_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
 
  //"/": (BuildContext context) => SplashScreen(),
 // "/": (BuildContext context) => SignUpScreen (),
    "/verify":(BuildContext context)=>VerificationScreen(),
    "/login":(BuildContext context) => LoginScreen(),
    "/signup":(BuildContext context)=>SignUpScreen(),
    "/home":(BuildContext context)=>HomeScreen(),
    "/main":(BuildContext context)=>MainScreen(),
    "/listingRooms":(BuildContext context)=>ListingRoomsScreen(),
    "/splash":(BuildContext context)=>SplashScreen(),
    "/forgotPassword":(BuildContext context)=>ForgotPasswordScreen(),
    "/rooms":(BuildContext context)=>RoomScreen(),
    "/listingAcRooms":(BuildContext context)=>ListingACRoomsScreen(),
    "/listingNonAcRooms":(BuildContext context)=>ListingNonACRoomsScreen(),


  // "/WebviewScreen": (BuildContext context) => WebviewScreen(),
  // "/SettingScreen": (BuildContext context) => SettingScreen(),
  // "/AddRssFeedScreen": (BuildContext context) => AddDirectFeedScreen(),
  //"/MainEditScreen": (BuildContext context) => MainEditScreen(),


};
