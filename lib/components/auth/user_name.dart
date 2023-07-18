import 'package:flutter/material.dart';
import 'package:guest_house_app/utils/validators.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget(this.getUsername);
  final Function getUsername;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //TODO check other options
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      
      onSaved: (value) => getUsername(value),
      autofocus: false,
      style: const TextStyle(fontSize: 16, fontStyle: FontStyle.normal),

      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: "Enter Your Name",
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          prefixIcon: const Icon(Icons.person),
          filled: true,
          fillColor: const Color(0xffeff0f6),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }
}
