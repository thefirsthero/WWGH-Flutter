String? validateEmail(String? value) {
  
  
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value!=null && value.isEmpty) {
    return "Your Email is required";
  } else if (value!=null && !regex.hasMatch(value)) {
    return "Please provide a valid emal address";
  }
  return null;
  
}
String? validatePassword(String? value){
  if (value != null && value.isEmpty){
    return "Password is Required";
  }
  else if(value!=null && value.length<8){
    return "Password should be alteast 8 characters";
  }
  return null;
}

