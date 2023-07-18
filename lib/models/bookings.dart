

import 'package:json_annotation/json_annotation.dart';

// enum Status{
//   Booked,
//   Cancelled,

// }
part 'bookings.g.dart';

@JsonSerializable()
class Bookings {
  String bookingId;
  String userId;
  List<String> guests;
  String paymentId;
  DateTime checkIn;
  DateTime checkOut;
  String stutus;
  String roomId;

  Bookings({required this.bookingId,required this.userId,required this.guests,required this.paymentId,
  required this.checkIn,required this.checkOut,required this.stutus,required this.roomId});

  
  

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Bookings.fromJson(Map<String, dynamic> json) => _$BookingsFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$BookingsToJson(this);
  

}