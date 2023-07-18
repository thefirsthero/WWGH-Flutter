import 'package:flutter/material.dart';
import 'package:guest_house_app/providers/auth_provider.dart';
import 'package:guest_house_app/providers/user_provider.dart';
import 'package:guest_house_app/styles/constants.dart';
import 'package:guest_house_app/styles/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ProfileScreen(),
      ),
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return SizedBox(
      width: queryData.size.width,
      child: Column(
        children: [
          headbarContainer(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10,),
              width: double.infinity,
              child: ListView(
                padding: const EdgeInsets.all(5),
                children: [
                  Consumer<UserProvider>(builder: (context, userdata, child) =>   ListTile(
                    leading: userdata.user.image !=null ? Image.network(userdata.user.image!) :   Image.asset("assets/profile-image.png"),
                    title: Text(
                      "Hi " + (userdata.user.userName ?? " "),
                      style: Themes.profileName,
                    ),
                    subtitle: Text(
                      userdata.user.email,
                      style: Themes.profileEmail,
                    ),
                  ),),
                
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Divider(thickness: 2,),
                  ),
                  ListTile(leading: Icon(Icons.edit , color: Colors.black,),title: Text("Edit Profile" , style: Themes.profileSettingName,),),
                  ListTile(leading: Icon(Icons.language , color: Colors.black,),title: Text("About US"
                  ,style: Themes.profileSettingName,),),
                  ListTile(leading: Icon(Icons.error_outline_outlined , color: Colors.black,),title: Text("Terms & Conditions",style: Themes.profileSettingName,),),
                  ListTile(leading: Icon(Icons.call , color: Colors.black,),title: Text("Contact Us",style: Themes.profileSettingName,),),
                   ListTile(leading: Icon(Icons.logout , color: Colors.black,),title: Text("Sign Out",style: Themes.profileSettingName,),onTap: Provider.of<AuthProvider>(context).signout,),
                 

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container headbarContainer() {
    return Container(
      height: 120,
      width: double.infinity,
      color: Colors.blue,
      padding: EdgeInsets.only(left: 30, top: 30),
      child: Align(
        child: Text(
          "Profile",
          style: Themes.title,
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
