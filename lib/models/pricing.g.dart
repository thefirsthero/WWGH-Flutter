// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pricing _$PricingFromJson(Map<String, dynamic> json) => Pricing(
      userType: json['userType'] as String,
      roomId: json['roomId'] as String,
      price: json['price'] as String,
    );

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'userType': instance.userType,
      'price': instance.price,
      'roomId': instance.roomId,
    };
