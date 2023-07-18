import 'package:flutter/material.dart';
import 'package:guest_house_app/styles/themes.dart';

class ElevatedButtons{

  Widget buildSubmitButton(BuildContext context , Function function,String name){

    return  SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () => function(context),
        child: Text(
          name,
          style: Themes.title,
        ),
      ),
    );

  }
  Widget buildSearchButton(BuildContext context , Function function,String name,double height){

    return  SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: () => function(context),
        child: Text(
          name,
          style: Themes.title,
        ),
      ),
    );

  }
  
}