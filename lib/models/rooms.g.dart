// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rooms _$RoomsFromJson(Map<String, dynamic> json) => Rooms(
      roomId: json['roomId'] as String,
      roomType: json['roomType'] as String,
      noOfGuests: json['noOfGuests'] as int,
      amenities: Map<String, String>.from(json['amenities'] as Map),
      termsAndConditions: (json['termsAndConditions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      saftyAndHygine: (json['saftyAndHygine'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cancellationPolicy: (json['cancellationPolicy'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomsToJson(Rooms instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'roomType': instance.roomType,
      'noOfGuests': instance.noOfGuests,
      'amenities': instance.amenities,
      'termsAndConditions': instance.termsAndConditions,
      'saftyAndHygine': instance.saftyAndHygine,
      'cancellationPolicy': instance.cancellationPolicy,
    };
