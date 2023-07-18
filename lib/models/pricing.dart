

import 'package:json_annotation/json_annotation.dart';


part "pricing.g.dart";

@JsonSerializable()
class  Pricing {
  String userType;
  String price;
  String roomId;

  Pricing({
    required this.userType,
    required this.roomId,
    required this.price

  });
  
   factory Pricing.fromJson(Map<String, dynamic> json) => _$PricingFromJson(json);
  Map<String, dynamic> toJson() => _$PricingToJson(this);
}