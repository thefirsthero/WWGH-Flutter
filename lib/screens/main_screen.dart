import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guest_house_app/components/buttons/elevatedbutton.dart';
import 'package:guest_house_app/components/search.dart';
import 'package:guest_house_app/routes/arguments.dart';

import 'package:guest_house_app/styles/constants.dart';
import 'package:guest_house_app/styles/themes.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainScreen(),
    ),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    print(210 / queryData.size.height);
    return Scaffold(
      body: SizedBox(
        height: queryData.size.height,
        width: queryData.size.width,
        child: Column(
          children: [
            Container(
              height: queryData.size.height * 0.46,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //appbar

                  buildAppbar(queryData),
                  Positioned(
                    top: queryData.size.height * 0.115,
                    child: Search(),
                  ),
                ],
              ),
            ),
            //listing the rooms
            Expanded(
              //color: Colors.black,
              //TODO implement listviw
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    buildRoomCardContainer(queryData, "  AC Rooms",
                        "AC Room Single and Sharing", context),
                    buildRoomCardContainer(queryData, "  Non-AC Rooms",
                        "Non-AC Room Single and Sharing", context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildRoomCardContainer(
      MediaQueryData queryData, cardRoomType, text, BuildContext context) {
    return Container(
      // height: queryData.size.width * 0.3,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: () {
          if (text == "AC Room Single and Sharing") {
            Navigator.pushNamed(context, "/listingAcRooms",arguments:SearchArguments(DateTime.now(),DateTime.now(),01,01));
          } else {
            Navigator.pushNamed(context, "/listingNonAcRooms",arguments:SearchArguments(DateTime.now(),DateTime.now(),01,01));
          }
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(cardRoomType,
                    style: Themes.hotelCardTitle, textAlign: TextAlign.left),
                IconButton(
                  onPressed: () {
                    if (text == "AC Room Single and Sharing") {
                      Navigator.pushNamed(context, "/listingAcRooms",arguments:SearchArguments(DateTime.now(),DateTime.now(),01,01),);
                    } else {
                      Navigator.pushNamed(context, "listingNonAcRooms",arguments: SearchArguments(DateTime.now(),DateTime.now(),01,01),);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Container(
              height: 220,
              //width: queryData.size.width * 0.8,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Stack(
                    children: [
                      backgroundImageContainer(
                          queryData.size.width * 0.9, 220.0),
                      backgroundGradientContainer(
                          queryData.size.width * 0.9, 220.0),
                      foregroundItems(queryData.size.width * 0.9, 220.0, text),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned buildAppbar(MediaQueryData queryData) {
    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: queryData.size.height * 0.15,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Chitravathi Guest House",
                style: Themes.appbarTitle,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  Constants.Notification,
                  height: 20,
                ),
              )
            ],
          ),
        ));
  }

  backgroundGradientContainer(cardWidth, cardHeight) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.4),
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.black.withOpacity(0.4),
          ],
          begin: Alignment.topCenter,
          end: Alignment(0.0, 0.6),
        ),
      ),
    );
  }

  backgroundImageContainer(cardWidth, cardHeight) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/room1.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  foregroundItems(cardHeight, cardWidth, text) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: Themes.cardTitle,
            textAlign: TextAlign.left,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Text(
                    "Anantapuramu",
                    style: Themes.cardSubtitle,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "4.5",
                    style: Themes.cardSubtitle,
                  ),
                  const Icon(
                    Icons.star_rate_sharp,
                    color: Colors.yellow,
                    size: 14,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
