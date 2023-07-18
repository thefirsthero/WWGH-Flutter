
import 'package:flutter/cupertino.dart';
import 'package:guest_house_app/styles/constants.dart';

class BackgroudImage{
    Image bulidImage(double height, double width) {
    return Image.asset(
      Constants.HOUSE_IMAGE,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

}