
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class User{
  @JsonKey(required: true)
  String userId;
  @JsonKey(required: true)
  String email;
  @JsonKey(required: true)
  List<String> bookings;
  @JsonKey(required: true)
  List<String> guests;
  String? userName;
  String? image;

 
  
  User({required this.userId,required this.email,required this.bookings,required this.guests ,this.userName,this.image });


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);





  
}
