import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guest_house_app/routes/arguments.dart';
import 'package:guest_house_app/styles/constants.dart';
import 'package:guest_house_app/styles/themes.dart';

void main() {
  runApp(
    MaterialApp(
      home: RoomScreen(),
    ),
  );
}

class RoomScreen extends StatelessWidget {
  RoomScreen({Key? key}) : super(key: key);

  //list amenities
  final List<List<String>> amenities = [
    [Constants.AIR_CONDITIONER, "AC Rooms"],
    [Constants.AMENITIES_TV, "TV"],
    [Constants.AMENITIES_WIFI, "Free Wifi"],
    [Constants.AMENITIES_BATTERY, "Power Backup"],
    [Constants.WATER, "24/7 Hot Water"],
    [Constants.AMENITIES_ELEVATOR, "Elevator"],
  ];
  //list of pricing Details
  final List<List<String>> pricingDetails = [
    ["Faculty Designation", "Price"],
    ["Faculty Designation", "Price"],
    ["Faculty Designation", "Price"],
    ["Faculty Designation", "Price"],
    ["Faculty Designation", "Price"],
  ];
  //list of terms and conditions
  final List<String> termsAndConditions = [
    "PAN Cards, office ID and Non-Govt IDs are not accepted."
        "Passport, Aadhar, Driving License are accepted.",
    "Hotel staff is trained on hygiene guidlines",
    "Guests with fever are not allowed.",
  ];
  //list of cancellation Policy
  final List<String> cancellationPloicy = [
    "No refund if cancelled within 24 hrs from the booking date."
        "Cash at hotel bookings can be cancelled any time.",
    "partial refund if cancelled 5 days prior to booking date.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  ];

  final List<String> safetyAndHygine = [
    "Qualantine protocols are being followed as ger rules."
        "Cash at hotel bookings can be cancelled any time.",
    "Guests from containment zones are allowed",
    "Thermal screening is done at entry and exit points",
  ];

 

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as RoomArguments;
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(args.roomType),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoomImages(),
              const SizedBox(
                height: 20,
              ),
              Text(
                args.roomSubType,
                style: Themes.roomsTypeName,
                textAlign: TextAlign.left,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    color: Colors.blue,
                  ),
                  Text(
                    "View On Map",
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: GoogleFonts.nunitoSans().fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              buildAmenitiesContainer(queryData),
              Divider(color: Colors.grey[200],thickness: 3,),
              buildPricingDetailsContainer(),
              Divider(color: Colors.grey[200],thickness: 3,),
              buildDetailsContainer(termsAndConditions, "Terms And Conditions",40.0),
              Divider(color: Colors.grey[200],thickness: 3,),
              buildDetailsContainer(cancellationPloicy, "Cancellation Policy",50.0),
              Divider(color: Colors.grey[200],thickness: 3,),
              buildDetailsContainer(safetyAndHygine, "Safety and Hygiene",60.0),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 55,
        width: queryData.size.width * 0.8,
        child: FloatingActionButton.extended(
            onPressed: () {},
          


            label: Text("Book Now",style: TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: Color(0xffffffff),
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    
    
    ),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)

            ),
          ),
      ),
    );
  }

  Column buildPricingDetailsContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildRoomTitleContainer("Pricing Details"),
        LimitedBox(
          maxHeight: 25.0 * pricingDetails.length,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: pricingDetails.length,
            itemBuilder: (context, index) {
              return // Place
                  RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.nunitoSans().fontFamily,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        text: "\u2022 " + pricingDetails[index][0]),
                    TextSpan(
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.nunitoSans().fontFamily,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0),
                        text: "- " + pricingDetails[index][1]),
                    TextSpan(
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.nunitoSans().fontFamily,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        text: " ")
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column buildDetailsContainer(List<String> list, title,height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildRoomTitleContainer(title),
        LimitedBox(
          maxHeight: height* list.length,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Text(
                "\u2022  " + list[index],
                style: TextStyle(
                  fontFamily: GoogleFonts.nunitoSans().fontFamily,
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Padding buildRoomTitleContainer(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        text,
        style: Themes.hotelCardTitle,
        textAlign: TextAlign.left,
      ),
    );
  }

  Column buildAmenitiesContainer(MediaQueryData queryData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildRoomTitleContainer("Amenities"),
        LimitedBox(
          maxHeight: 40.0 * amenities.length / 2,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 5,
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4),
            itemCount: amenities.length,
            itemBuilder: (BuildContext context, int index) {
              return GridTileBar(
                leading: Image.asset(
                  amenities[index][0],
                  width: 16,
                  height: 16,
                  color: Colors.grey,
                ),
                title: Text(
                  amenities[index][1],
                  style: Themes.profileEmail,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class RoomImages extends StatefulWidget {
  const RoomImages({
    Key? key,
  }) : super(key: key);

  @override
  State<RoomImages> createState() => _RoomImagesState();
}

class _RoomImagesState extends State<RoomImages> {
  List<List<String>> roomImages = [
    [Constants.ROOM_BEDROOM, "Bed Room"],
    [Constants.ROOM_BED, "Bed"],
    [Constants.ROOM_BATHROOM1, "Bathroom"],
    [Constants.ROOM_BATHROOM2, "Bathroom"]
  ];
  String currentImage = "";
  @override
  void initState() {
    super.initState();
    currentImage = roomImages[0][0];
  }

  setImage(int index) {
    setState(() {
      currentImage = roomImages[index][0];
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return SizedBox(
      child: Column(
        children: [
          backgroundImageContainer(
            currentImage,
            185.0,
          ),
          SizedBox(
            height: 90,
            width: queryData.size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: roomImages.length,
              itemBuilder: (BuildContext context, int index) {
                //print(roomImages[index][0]);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: InkWell(
                    onTap: () => setImage(index),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Stack(
                        children: [
                          backgroundImageContainer(
                              roomImages[index][0], 70.0, 90.0),
                          backgroundGradientContainer(90.0, 70.0),
                          foregroundItems(90.0, 70.0, roomImages[index][1]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  backgroundImageContainer(image, height, [double width = double.infinity]) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  backgroundGradientContainer(
    cardWidth,
    cardHeight,
  ) {
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

  foregroundItems(cardHeight, cardWidth, title) {
    return Positioned(
      bottom: 2,
      left: 4,
      right: 2,
      child: Text(
        title,
        style: Themes.roomsImageName,
        textAlign: TextAlign.left,
      ),
    );
  }
}
