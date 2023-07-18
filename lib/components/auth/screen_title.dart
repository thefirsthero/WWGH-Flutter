
import 'package:flutter/material.dart';
import 'package:guest_house_app/styles/themes.dart';
class ScreenTitle extends StatelessWidget {
  final String title;
  const ScreenTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 45,
      child: Center(
        child: Text(title,
            style: Themes.title, textAlign: TextAlign.center),
            
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(9)),
        color: Color(0xff2d8de4),
      ),
    );
  }
}
