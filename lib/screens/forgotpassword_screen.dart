import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guest_house_app/components/auth/backgoudImage.dart';
import 'package:guest_house_app/components/auth/cofirm_password.dart';
import 'package:guest_house_app/components/auth/screen_title.dart';
import 'package:guest_house_app/components/buttons/elevatedbutton.dart';
import 'package:guest_house_app/components/buttons/textbutton.dart';
import 'package:guest_house_app/models/user.dart';
import 'package:guest_house_app/routes/arguments.dart';
import 'package:guest_house_app/screens/verification_screen.dart';
import 'package:guest_house_app/services/user_service.dart';

import 'package:guest_house_app/styles/constants.dart';
import 'package:guest_house_app/components/auth/email_widget.dart';
import 'package:guest_house_app/components/auth/password_widget.dart';

import 'package:guest_house_app/styles/themes.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: ForgotPasswordScreen(),
//     ),
//   );
// }
class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String? _username;

  String? _password;

  Map<String, dynamic>? user;

  getUsername(value) {
    _username = value;
  }

  getPassword(value) {
    _password = value;
  }

  doLogin(context) {
    final form = ForgotPasswordScreen._formKey.currentState;

    if (form != null && form.validate()) {
      form.save();
      //after http request
      //UserService.signup(_username!, _password!).then((response){
      //   if(response['status']){
      //     user = response['data'];
      //     //Provider.of<UserProvider>(context, listen: false).setUser(user);
      //     //UserSharedPreferences().saveUser(authUser);
      //     form.reset();
      //     Navigator.pushReplacementNamed(context, '/verify',arguments: user);

      //   }else{
      //     print(response['data']);
      //     Fluttertoast.showToast(msg: response['message']);
      //   }
      // });
      user = {
        "id": 1,
        "email": _username,
        "bookings": [""],
        "guests": [""],
        "token": "kdsljflklfljglksjgl/j;et",
        "otp": "123456",
      };
      print(user);
      User _user = User.fromJson(user!);
      Navigator.pushReplacementNamed(context, '/verify',
          arguments: VerifyScreenArguments(_user));
    }
  }

  changeIndex() {
    setState(() {
      _index = 1;
    });
  }

  int _index = 0;

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
                  child: const ScreenTitle("SignIn")),

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
      child: IndexedStack(
        index: _index,
        children: [
          SendOtp(changeIndex: changeIndex),
          UpdatePassword(),
        ],
      ),
    );
  }
}

class SendOtp extends StatelessWidget {
  SendOtp({Key? key, required this.changeIndex}) : super(key: key);
  Function changeIndex;

  static final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  Map<String, dynamic>? user;

  getUsername(value) {
    _username = value;
  }

  doSendOtp(context) {
    changeIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Email
              EmailWidget(getUsername),
              const SizedBox(
                height: 25,
              ),

              const SizedBox(
                height: 25,
              ),
              ElevatedButtons()
                  .buildSubmitButton(context, doSendOtp, "Send OTP"),

              const SizedBox(
                height: 10,
              ),

              Text("Or", style: Themes.orStyle, textAlign: TextAlign.left),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 25,
              ),
              TextButtons().buildButton(context, "/signup", "Go Back"),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdatePassword extends StatelessWidget {
  UpdatePassword({Key? key}) : super(key: key);

  static final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;
  Map<String, dynamic>? user;

  getUsername(value) {
    _username = value;
  }

  doUpdatePassword(context) {}
  getPassword() {}
  getConfirmPassword() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Email
              EmailWidget(getUsername),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Enter the new Password",
                style: TextStyle(fontSize: 16),
              ),
              PasswordWidget("Enter New Password", getPassword),

              const SizedBox(
                height: 25,
              ),
              PasswordWidget("Enter Confirm Password", getConfirmPassword),

              const SizedBox(
                height: 25,
              ),
              ElevatedButtons()
                  .buildSubmitButton(context, doUpdatePassword, "Update Password"),

              const SizedBox(
                height: 10,
              ),
              Text("Or", style: Themes.orStyle, textAlign: TextAlign.left),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 25,
              ),
              TextButtons().buildButton(context, "/signup", "Go Back"),
            ],
          ),
        ),
      ),
    );
  }
}
