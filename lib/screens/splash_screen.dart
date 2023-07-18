import 'package:flutter/material.dart';
import 'package:guest_house_app/styles/constants.dart';
import 'package:guest_house_app/styles/themes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: query.size.height,
        width: query.size.width,
        child: Stack(
          children: [
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Constants.COLLEGE_IMAGE),
                  Text(
                    Constants.APP_NAME,
                    style: Themes.headline,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                children: [Image.asset(Constants.HOTEL_IMAGE)],
              ),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    ));
  }
}
