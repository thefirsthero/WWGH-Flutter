
import 'package:json_annotation/json_annotation.dart';
// enum UserType {
//    Faculty,
//    Alumini,
//    Others,
// }
part "guests.g.dart";

@JsonSerializable()
class Guests {
   String guestId;
   String userId;
   String gmail;
   String userType;
   String pricingId;
   String? idCard;

   Guests({required this.guestId , required this.userId , required this.gmail , required this.userType,required this.pricingId,this.idCard});

   factory Guests.fromJson(Map<String, dynamic> json) => _$GuestsFromJson(json);
  Map<String, dynamic> toJson() => _$GuestsToJson(this);
}