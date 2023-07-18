import 'package:flutter/material.dart';
import 'package:guest_house_app/components/auth/backgoudImage.dart';
import 'package:guest_house_app/components/auth/screen_title.dart';
import 'package:guest_house_app/screens/login_screen.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {

// This widget is the root
// of your application.
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'PageView',
	theme: ThemeData(
		primarySwatch: Colors.blue,
	),
	debugShowCheckedModeBanner: false,
	home: SwappingWidget(),
	);
}
}

class SwappingWidget extends StatefulWidget {
  const SwappingWidget({Key? key}) : super(key: key);

  @override
  State<SwappingWidget> createState() => _SwappingWidgetState();
}

class _SwappingWidgetState extends State<SwappingWidget> {
  double _width =0;
  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);
    //_width = query.size.width*0.8;
    return Scaffold(

      body: Container(
        height: query.size.height,
        width: query.size.width,
        child: Row(children: [
          AnimatedContainer(duration: Duration(seconds: 1),
          //width: double.infinity,
          width:_width,
          child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: query.size.height,
            width: query.size.width,
            child: Stack(
              children: [
                BackgroudImage().bulidImage( query.size.height*0.4,query.size.width),

                Positioned(
                    top: query.size.height*0.4,
                    child: Center(
                      child: Container(
                        
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        height: query.size.height-query.size.height*0.4,
        width: query.size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),))),

                Positioned(
                    top: query.size.height*0.38,
                    left: query.size.width * 0.35 - 45,
                    right: query.size.width * 0.35 - 45,
                    child: const ScreenTitle("SignIn")),

                //SingleChildScrollView(reverse:true,child: Align(alignment: Alignment.bottomCenter, child: SignUp())),
              ],
            ),
          ),
        ),
          ),
          ElevatedButton(onPressed:(){
            setState(() {
              _width = 400;
            });
          } , child: Text("Click me"))
        ],),
      ),
    );
  }
}

