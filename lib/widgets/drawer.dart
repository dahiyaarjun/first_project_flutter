import 'dart:convert';

import 'package:first_project_flutter/custom_helper/constants.dart';
import 'package:first_project_flutter/pages/login.dart';
import 'package:first_project_flutter/pages/profileSettings.dart';
import 'package:first_project_flutter/pages/searchchat.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyDrawer extends StatefulWidget {
   MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();

}

class _MyDrawerState extends State<MyDrawer> {
      UserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('accessToken').toString();
    // print("token is $token");
    apiUserDetails(token: token);
  }
  initState() {
    UserDetails();
  }

  String name = "";
  String email = "";
  String img = "";

  static String baseUrl = AppConstants.baseUrl;

  Future<void> apiUserDetails({required String token}) async {
    try {
      String apiUrl = '${baseUrl}api/user/details';
      print('apiHit');
      var Response = await http.post(
        Uri.parse(apiUrl),
        body: {'token': token},
      );
      if (Response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(Response.body);

        // print('arjun');

        // print(userData['User Details'][0]['name']);
        setState(() {
          name = userData['User Details'][0]['name'];
          email = userData['User Details'][0]['email'];
          if (userData['url'] != null) img = userData['url'];
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  final TextEditingController _message = TextEditingController();
  String message = "";
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height*0.35,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.18,
                    width: MediaQuery.of(context).size.width*0.36,
                        decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                     child:InstaImageViewer(
                      // child: Container(
                    //      height: MediaQuery.of(context).size.height*0.10,
                    // width: MediaQuery.of(context).size.width*0.2,
                        // radius: 60,
                        // backgroundImage: (img!="")?NetworkImage(img):NetworkImage("https://res.cloudinary.com/dlpxw0zdc/image/upload/v1713023429/CommonPhotos/oc72d5v5mz9wijnggxs5.png")),
                        child: (img!="")?Image.network(img, fit: BoxFit.fill):Image.network("https://res.cloudinary.com/dlpxw0zdc/image/upload/v1713023429/CommonPhotos/oc72d5v5mz9wijnggxs5.png", fit: BoxFit.fill)
                        // ),
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
                    ListTile(
            leading: Icon(Icons.search_off),
            title: Text('ChatGpt'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Search(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile Settings'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Settings(email: email),
            )),
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text('Sign Out'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text("Do you really want to Sign Out?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();

                                await pref.clear();
                                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (BuildContext context){
                                    return const UserLogin();
                                    },),(route) => false,);
                                // setState(() {});
                              },
                              child: Text('OK')),
                        ],
                      ));
            },
          ),
        ],
      ));
  }
}
