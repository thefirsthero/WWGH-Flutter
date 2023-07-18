
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guest_house_app/components/auth/backgoudImage.dart';
import 'package:guest_house_app/components/auth/cofirm_password.dart';
import 'package:guest_house_app/components/auth/screen_title.dart';
import 'package:guest_house_app/components/auth/user_name.dart';
import 'package:guest_house_app/components/buttons/elevatedbutton.dart';
import 'package:guest_house_app/components/buttons/textbutton.dart';
import 'package:guest_house_app/models/user.dart';
import 'package:guest_house_app/providers/auth_provider.dart';
import 'package:guest_house_app/routes/arguments.dart';
import 'package:guest_house_app/screens/verification_screen.dart';
import 'package:guest_house_app/services/auth.dart';
import 'package:guest_house_app/services/user_service.dart';

import 'package:guest_house_app/styles/constants.dart';
import 'package:guest_house_app/components/auth/email_widget.dart';
import 'package:guest_house_app/components/auth/password_widget.dart';

import 'package:guest_house_app/styles/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  String? _email;
  Map<String, dynamic>? user;

  getUsername(value) {
    _username = value;
  }
  getEmail(value){
    _email = value;
  }

  getPassword(value) {
    _password = value;
  }
  toastMesssage(String msg){
     return Fluttertoast.showToast(  
        msg: 'CheckInDate should not be less than CheckOutDate',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        timeInSecForIosWeb: 8,
          
        backgroundColor: Colors.grey,
        ); 
          
  }

  //validating the password and confirm password are same
  String? validateConfirmPassword(String? value) {
    if (value != null && value.isEmpty) {
      return "Password is Required";
    } else if (value != null && value != _password) {
      return "Confirm Password does not match";
    }
    return null;
  }

  doRegister(context) {
    final form = _formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      AuthProvider().registerAccount(_email!, _username!, _password!, (e)=>toastMesssage(e));
      


     
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    double imageHeight = query.size.height * 0.5;
    double formHeight = query.size.height * 0.35;
    double screenTitleHeight = query.size.height * 0.32;
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
                    child: buildForm(query.size.height - formHeight,
                        query.size.width, context),
                  )),

              Positioned(
                  top: screenTitleHeight,
                  left: query.size.width * 0.45 - 45,
                  right: query.size.width * 0.45 - 45,
                  child: const ScreenTitle("SignUp")),

              //SingleChildScrollView(reverse:true,child: Align(alignment: Alignment.bottomCenter, child: SignUp())),
            ],
          ),
        ),
      ),
    );
  }


  Container buildForm(double height, double width, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                 //UserName
                UserNameWidget(getUsername),
                const SizedBox(
                  height: 25,
                ),
                //Email
                EmailWidget(getEmail),
                const SizedBox(
                  height: 25,
                ),
                //password
                PasswordWidget("Enter Password", getPassword),
                const SizedBox(
                  height: 25,
                ),
                //Confirm Password
                ConfirmPasswordWidget(
                    "Confirm Password", validateConfirmPassword),
                const SizedBox(
                  height: 25,
                ),
                buildRichText(),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButtons().buildSubmitButton(context, doRegister, "Create Account"),
                const SizedBox(
                  height: 10,
                ),
                Text("Or", style: Themes.orStyle, textAlign: TextAlign.left),
                const SizedBox(
                  height: 10,
                ),
                buildGoogleSignIn(context),
                const SizedBox(
                  height: 20,
                ),
                TextButtons().buildButton(context, "/login", "LogIn to your account")
              ],
            ),
          ),
        ),
      ),
    );
  }

  

  SizedBox buildGoogleSignIn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: OutlinedButton.icon(
        onPressed: Provider.of<AuthProvider>(context).googleSign,
//         onPressed:()=>AuthService().googleLogin((){
//            ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//   content: Text('Something Went Wrong. Try Again'),
// )
//            );
//         }),
        icon: Image.asset(Constants.GOOGLE_LOGO),
        label: const Text(
          "Sign Up with Google",
          style: TextStyle(color: Colors.black),
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
              text: "Accepting ",
              style: TextStyle(
                fontFamily: GoogleFonts.nunitoSans().fontFamily,
                color: const Color(0xff757575),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          TextSpan(
            text: "All Terms & Conditions\nPrivacy policies",
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
