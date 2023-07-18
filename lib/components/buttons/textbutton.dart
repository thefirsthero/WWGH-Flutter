import 'package:flutter/material.dart';
class TextButtons{

  Container buildButton(BuildContext context , String route,String name){

    return Container(
      padding: const EdgeInsets.only(
        bottom: 0.8, // space between underline and text
      ),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.blue, // Text colour here
        width: 1.0, // Underline width
      ))),
      child: TextButton(
          onPressed: ()=>Navigator.pushReplacementNamed(context,route ),
          child:  Text(
            name,
            style:const TextStyle(
              color: Color(0xff2d8de4),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.75,
            ),
          )),
    );

  }


}