import 'dart:convert';
import 'package:guest_house_app/models/user.dart';
import 'package:guest_house_app/services/service_urls.dart';
import 'package:guest_house_app/utils/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserService {
static  Future<Map<String, dynamic>> signup(String email, String password) async {
    
    var url = Uri.parse(ServiceUrl.SIGNUP);
   
    return  await http.post(
            url, 
            body: {"email": email, "password": password})
            .then(onValue)
            .catchError(onError); 
     
      
  }
    Future<Map<String, dynamic>> signin(String email, String password) async {
    
    var url = Uri.parse(ServiceUrl.SIGNIN);
   
    return  await http.post(
            url, 
            body: {"email": email, "password": password})
            .then(onValue)
            .catchError(onError); 
     
      
  }




   static Future<Map<String,dynamic>> onValue(response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {

      

      
      result = {
          'status': true,
          'message': 'Successful',
          'data': jsonDecode(response.body)
        };
       } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error'],
        'data': json.decode(response.body),
      };
    }

    return result;
  }

  static Map<String,dynamic> onError(error) {
    print("the error is $error.detail");
    var result = {'status': false, 'message': 'Something went wrong. Please try again.', 'data': error};
    return result;
  }

}

