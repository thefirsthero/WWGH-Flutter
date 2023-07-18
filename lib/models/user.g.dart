// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['userId', 'email', 'bookings', 'guests'],
  );
  return User(
    userId: json['userId'] as String,
    email: json['email'] as String,
    bookings:
        (json['bookings'] as List<dynamic>).map((e) => e as String).toList(),
    guests: (json['guests'] as List<dynamic>).map((e) => e as String).toList(),
    userName: json['userName'] as String,
    image: json["image"] as String
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
     
      'email': instance.email,
      'bookings': instance.bookings,
      'guests': instance.guests,
      'UserName':instance.userName,
      'image':instance.image,
      
    };
