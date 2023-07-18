



import 'package:json_annotation/json_annotation.dart';

part 'rooms.g.dart';

// enum RoomType{
//   AcRoomSharing,
//   NonAcRoomSharing,
//   AcRoomNonSharing,
//   NonAcRoomShring
// }
@JsonSerializable()
class Rooms {
   String roomId;
   String roomType;
   int noOfGuests;
   //icon , name
   Map<String,String> amenities;
   List<String> termsAndConditions;
   List<String> saftyAndHygine;
   List<String> cancellationPolicy;

   Rooms({
     required this.roomId,
     required this.roomType,
     required this.noOfGuests,
     required this.amenities,
     required this.termsAndConditions,
     required this.saftyAndHygine,
     required this.cancellationPolicy,

   });

  factory Rooms.fromJson(Map<String, dynamic> json) => _$RoomsFromJson(json);
  Map<String, dynamic> toJson() => _$RoomsToJson(this);
  

   
}