import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guest_house_app/components/auth/backgoudImage.dart';
import 'package:guest_house_app/components/auth/cofirm_password.dart';
import 'package:guest_house_app/components/auth/screen_title.dart';
import 'package:guest_house_app/components/buttons/elevatedbutton.dart';
import 'package:guest_house_app/models/user.dart';
import 'package:guest_house_app/providers/user_provider.dart';
import 'package:guest_house_app/routes/arguments.dart';
import 'package:guest_house_app/services/user_service.dart';

import 'package:guest_house_app/styles/constants.dart';
import 'package:guest_house_app/components/auth/email_widget.dart';
import 'package:guest_house_app/components/auth/password_widget.dart';

import 'package:guest_house_app/styles/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guest_house_app/utils/shared_preferences.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';



class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as VerifyScreenArguments ;
    User user = args.user;
    MediaQueryData query = MediaQuery.of(context);
    double imageHeight = query.size.height * 0.6;
    double formHeight = query.size.height * 0.55;
    double screenTitleHeight = query.size.height * 0.52;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: query.size.height,
          width: query.size.width,
          child: Stack(
            children: [
             BackgroudImage().bulidImage(imageHeight, query.size.width),
              Positioned(
                  top: formHeight,
                  child: Center(
                    child: OtpPinField(user: user),
                  )),

              Positioned(
                  top: screenTitleHeight,
                  left: query.size.width * 0.45 - 45,
                  right: query.size.width * 0.45 - 45,
                  child: const ScreenTitle("Verify")),

              //SingleChildScrollView(reverse:true,child: Align(alignment: Alignment.bottomCenter, child: SignUp())),
            ],
          ),
        ),
      ),
    );
  }


}

class OtpPinField extends StatefulWidget {
   OtpPinField({
    Key? key,
    required this.user,

  }) : super(key: key);
  User user;

  @override
  State<OtpPinField> createState() => _OtpPinFieldState();
}

class _OtpPinFieldState extends State<OtpPinField> {
  late StreamController<ErrorAnimationType> errorController;
 
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  String otpvalue = "123456";
  String isCorrect = "";
  doVerify(context) {
    print("1");
    if (currentText == otpvalue) {
      //print(value);
      
      ///save the user and navigate to the Home Screen
      
      
      setState(() {
        isCorrect=""; 
      });
      print(2);
      
      print(3);
      Provider.of<UserProvider>(context, listen: false).setUser(widget.user);
      print(4);
      //UserSharedPreferences().saveUser(widget.user);
      Navigator.pushReplacementNamed(context, "/home");

    } else {
      //print(value);
      print(true);
      setState(() {
        isCorrect = "You have entered worng OTP";
        errorController.addError(isCorrect);
      });
    }
  }

  @override
  void initState() {
    
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    double formHeight = query.size.height * 0.55;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      height: query.size.height - formHeight,
      width: query.size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Enter the OTP sent to Haei@gmail.com",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: GoogleFonts.baloo().fontFamily),
          ),
          PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            autoFocus: true,

            pinTheme: PinTheme(
              inactiveColor: Colors.grey,
              //borderWidth: 0,
              shape: PinCodeFieldShape.underline,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,

              activeColor: Colors.grey,
            ),
            animationDuration: const Duration(milliseconds: 300),
            //backgroundColor: Colors.blue.shade50,
            //enableActiveFill: true,

            keyboardType: TextInputType.number,
           
            controller: textEditingController,
            onCompleted: (v) {},
            onChanged: (value) {
              print(value);
              setState(() {
                currentText = value;
              });
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
          Text(
            isCorrect,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          buildRichText(),
          ElevatedButtons().buildSubmitButton(context,doVerify,"Verify"),
          
        ],
      ),
    );
  }

  SizedBox buildVerifyButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () => doVerify(context),
        child: Text(
          "Verify",
          style: Themes.title,
        ),
      ),
    );
  }

  RichText buildRichText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Go Back",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: GoogleFonts.nunitoSans().fontFamily,
              color: const Color(0xff2d8de4),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
