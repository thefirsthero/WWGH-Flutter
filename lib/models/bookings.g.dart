// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bookings _$BookingsFromJson(Map<String, dynamic> json) => Bookings(
      bookingId: json['bookingId'] as String,
      userId: json['userId'] as String,
      guests:
          (json['guests'] as List<dynamic>).map((e) => e as String).toList(),
      paymentId: json['paymentId'] as String,
      checkIn: DateTime.parse(json['checkIn'] as String),
      checkOut: DateTime.parse(json['checkOut'] as String),
      stutus: json['stutus'] as String,
      roomId: json['roomId'] as String,
    );

Map<String, dynamic> _$BookingsToJson(Bookings instance) => <String, dynamic>{
      'bookingId': instance.bookingId,
      'userId': instance.userId,
      'guests': instance.guests,
      'paymentId': instance.paymentId,
      'checkIn': instance.checkIn.toIso8601String(),
      'checkOut': instance.checkOut.toIso8601String(),
      'stutus': instance.stutus,
      'roomId': instance.roomId,
    };
