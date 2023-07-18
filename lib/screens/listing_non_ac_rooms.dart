import 'package:flutter/material.dart';
import 'package:guest_house_app/components/listingSearchContiner.dart';
import 'package:guest_house_app/routes/arguments.dart';
import 'package:guest_house_app/styles/constants.dart';
import 'package:guest_house_app/styles/themes.dart';

class ListingNonACRoomsScreen extends StatelessWidget {
  const ListingNonACRoomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SearchArguments;
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      body: SizedBox(
        width: queryData.size.width,
        child: Column(
          children: [
            ListingSearchContainer(args.checkIn, args.checkOut),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  padding: const EdgeInsets.all(5),
                  children: [
                    listingCardContainer(context, "Non-AC Sharing Room","Non-AC Room"),
                    listingCardContainer(context, "Non-AC Single Rooom","Non-AC Room"),
                  
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container listingCardContainer(BuildContext context, text,roomtype) {
    return Container(
      height: 340,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.pushNamed(context, "/rooms",arguments: RoomArguments(roomtype, text)),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                backgroundImageContainer(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(text,
                              style: Themes.listingCardTitle,
                              textAlign: TextAlign.left),
                          Row(
                            children: [
                              Text(
                                "4.5",
                                style: Themes.listingCardTitle,
                              ),
                              const Icon(
                                Icons.star_rate_sharp,
                                color: Colors.yellow,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //aminites
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Image.asset(Constants.NEWSPAPER,
                                        color: Colors.grey, width: 12),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      " Daily NewsPaper",
                                      style: Themes.listingCardSubtitle,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Constants.WATER,
                                      color: Colors.grey,
                                      width: 12,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      " Drinking Water",
                                      style: Themes.listingCardSubtitle,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //widget for showing the price
                          Column(children: [
                            Text(
                              "₹ 200",
                              style: Themes.listingCardPrice,
                            ),
                            Text(
                              "Per Day per bed",
                              style: Themes.listingCardPriceSubtitle,
                            )
                          ])
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  backgroundImageContainer() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/room1.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
