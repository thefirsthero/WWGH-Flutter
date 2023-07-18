import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static TextStyle headline = TextStyle(
      color: const Color(0xff000000),
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.baloo().fontFamily,
      fontStyle: FontStyle.normal,
      fontSize: 30.0);
  static TextStyle title = TextStyle(
      color: const Color(0xffffffff),
      //color: Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.baloo().fontFamily,
      fontStyle: FontStyle.normal,
      fontSize: 18.0);
  static TextStyle appbarTitle = TextStyle(
      color: const Color(0xffffffff),
      //color: Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.baloo().fontFamily,
      fontStyle: FontStyle.normal,
      fontSize: 20.0);
  static TextStyle orStyle = const TextStyle(
      color: Color(0xffa0a3bd),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16.0);

  static TextStyle inStyle = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: const Color(0xff27153e),
    fontSize: 15,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static TextStyle checkinStyle = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: Color(0xff757575),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static TextStyle datestyle = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: Color(0xff27153e),
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static TextStyle noRooms = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: Color(0xff27153e),
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static TextStyle monthstyle = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: Color(0xff757575),
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static TextStyle hotelCardTitle = TextStyle(
      color: const Color(0xff27153e),
      fontWeight: FontWeight.w700,
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
      fontStyle: FontStyle.normal,
      fontSize: 20.0);
  static TextStyle cardTitle = TextStyle(
    color:  const Color(0xffffffff),
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontStyle:  FontStyle.normal,
    fontSize: 18.0
);
static TextStyle cardSubtitle = TextStyle(
    color:  const Color(0xffffffff),
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontStyle:  FontStyle.normal,
    fontSize: 14.0
);
static TextStyle listingCardTitle = TextStyle(
    color:  const Color(0xff000000),
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontStyle:  FontStyle.normal,
    fontSize: 18.0
);
static TextStyle listingCardSubtitle = TextStyle(
    color:  Colors.grey,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontStyle:  FontStyle.normal,
    fontSize: 12.0
);
static TextStyle listingCardPrice =TextStyle(
    color:  const Color(0xff000000),
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontStyle:  FontStyle.normal,
    fontSize: 24.0
);
static TextStyle listingCardPriceSubtitle = TextStyle(
    color:  Colors.grey,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontStyle:  FontStyle.normal,
    fontSize: 11.0
);

static TextStyle bookingCardPrice =  TextStyle(
    color:  const Color(0xff000000),
    fontWeight: FontWeight.w800,
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontStyle:  FontStyle.normal,
    fontSize: 16.0
);
static TextStyle bookingViewDetails = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: const Color(0xff000000),
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: TextDecoration.underline,
    
    );

    // styles for profile screen
    static TextStyle profileName = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color:const Color(0xff27153e),
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    

) ;
    static TextStyle profileSettingName = TextStyle(
    fontFamily:  GoogleFonts.nunitoSans().fontFamily,
    color: const Color(0xff27153e),
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    
    
    );
    static TextStyle profileEmail= TextStyle(
    fontFamily:GoogleFonts.nunitoSans().fontFamily,
    color: const Color(0xff757575),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    
    
    );
     //rooms styles
    static TextStyle roomsImageName = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color:const Color(0xffffffff),
    fontSize: 10,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    
    
    );
   
    static TextStyle roomsTypeName = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: Color(0xff000000),
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    
    
    );
    static TextStyle roomsheading = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: Color(0xff000000),
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    
    
    );
    static TextStyle roomSubtitle = TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    color: Color(0xff000000),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    
    
    );


}
