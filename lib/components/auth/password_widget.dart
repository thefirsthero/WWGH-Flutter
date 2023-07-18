import 'package:flutter/material.dart';
import 'package:guest_house_app/utils/validators.dart';

class PasswordWidget extends StatefulWidget {
  final String text ; 
 
  Function getpassword;
  PasswordWidget(this.text,this.getpassword);

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
   bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //TODO check other options

      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      onSaved: (newValue) => widget.getpassword,
      style: const TextStyle(
          fontSize: 16, fontStyle: FontStyle.normal),
      obscureText: _isObscure,
      validator:(value){
        widget.getpassword(value);
        return validatePassword(value);},      
       
   

      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: widget.text,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(icon:Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
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
