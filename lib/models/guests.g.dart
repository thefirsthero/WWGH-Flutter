// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guests _$GuestsFromJson(Map<String, dynamic> json) => Guests(
      guestId: json['guestId'] as String,
      userId: json['userId'] as String,
      gmail: json['gmail'] as String,
      userType: json['userType'] as String,
      pricingId: json['pricingId'] as String,
      idCard: json['idCard'] as String?,
    );

Map<String, dynamic> _$GuestsToJson(Guests instance) => <String, dynamic>{
      'guestId': instance.guestId,
      'userId': instance.userId,
      'gmail': instance.gmail,
      'userType': instance.userType,
      'pricingId': instance.pricingId,
      'idCard': instance.idCard,
    };
