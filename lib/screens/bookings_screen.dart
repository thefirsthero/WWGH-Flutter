import 'package:flutter/material.dart';
import 'package:guest_house_app/styles/constants.dart';
import 'package:guest_house_app/styles/themes.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: BookingsScreen(),
      ),
    ),
  );
}

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return SizedBox(
      width: queryData.size.width,
      child: Column(
        children: [
          headbarContainer(),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ListView(
                padding: const EdgeInsets.all(5),
                children: [
                  listingCardContainer(queryData),
                  listingCardContainer(queryData),
                  listingCardContainer(queryData),
                  //listingCardContainer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container listingCardContainer(queryData) {
    return Container(
      height: 110,
      width: queryData.size.width * 0.9,
      //padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              backgroundImageContainer(),
              
              Container(
                width: queryData.size.width * 0.9 - 100,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Non AC Room 2 Sharing",
                      style: Themes.listingCardTitle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // date
                    Text("13 Mar - 14 Mar | 1 Room | 1 Guest",
                        style: Themes.listingCardSubtitle,
                        textAlign: TextAlign.left),
                        const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                      children: [
                        Text("Rs.1200/-",
                            style: Themes.bookingCardPrice,
                            textAlign: TextAlign.left),
                            
                      Text("View Details ",textAlign: TextAlign.right ,style: Themes.bookingViewDetails,),
                       
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  backgroundImageContainer() {
    return Container(
      height: 120,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/room1.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container headbarContainer() {
    return Container(
      height: 120,
      width: double.infinity,
      color: Colors.blue,
      padding: EdgeInsets.only(left: 30, top: 30),
      child: Align(
        child: Text(
          "My Bookings",
          style: Themes.title,
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
