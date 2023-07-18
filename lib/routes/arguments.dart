

import 'package:guest_house_app/models/user.dart';

class VerifyScreenArguments {
   final User user;
  VerifyScreenArguments(this.user);
}

class SearchArguments {
   final DateTime checkIn;
   final DateTime checkOut;
   final int noOfRooms;
   final int noOfGuests;
  SearchArguments(this.checkIn,this.checkOut,this.noOfGuests,this.noOfRooms);
}

class RoomArguments{
  final String roomType;
  final String roomSubType;
  RoomArguments(this.roomType,this.roomSubType);
}