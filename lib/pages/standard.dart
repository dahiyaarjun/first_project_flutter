import 'dart:convert';

import 'package:first_project_flutter/custom_helper/constants.dart';
import 'package:first_project_flutter/pages/profileSettings.dart';
import 'package:first_project_flutter/pages/resetPassword.dart';
import 'package:first_project_flutter/pages/searchchat.dart';
import 'package:first_project_flutter/pages/subject.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class standard extends StatefulWidget {
  @override
  State<standard> createState() => _MyWidgetState();

  standard({super.key});
  
}

  class _MyWidgetState extends State<standard> {
  UserDetails() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('accessToken').toString();
    // print("token is $token");
    apiUserDetails(token: token);
  }

  @override
  initState() {
    UserDetails();
  }

  String name = "";
  String email = "";
  String img = "";
  String Class = "";

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('LIBRARY'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        // elevation: 100,
      ),
      drawer: Drawer(
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
                     child: (img!="")?Image.network(img, fit: BoxFit.fill):Image.network("https://res.cloudinary.com/dlpxw0zdc/image/upload/v1713023429/CommonPhotos/oc72d5v5mz9wijnggxs5.png", fit: BoxFit.fill)
                        
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
                                Navigator.pushNamed(context, 'login');
                                setState(() {});
                              },
                              child: Text('OK')),
                        ],
                      ));
            },
          ),
        ],
      )),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 2.0, // Border width
                          ),
                          //  borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                            "https://res.cloudinary.com/dlpxw0zdc/image/upload/v1712926813/CommonPhotos/xkgmsofihairtf0j4idm.png",
                            fit: BoxFit.cover),
                      ),
                      onTap: () {
                        Class = "10th";
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => subject(Class)),
                        );
                      },
                    ),
                    const Text('10th Books'),
                  ]),
                  const SizedBox(width: 100),
                  Column(children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: Image.network(
                            "https://res.cloudinary.com/dlpxw0zdc/image/upload/v1712926843/CommonPhotos/blf64af2hfexvs7pyovg.png",
                            fit: BoxFit.cover),
                      ),
                      onTap: () {
                        Class = "12th";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => subject(Class)));
                      },
                    ),
                    const Text('10th Papers'),
                  ]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 2.0, // Border width
                          ),
                          //  borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                            "https://res.cloudinary.com/dlpxw0zdc/image/upload/v1712926823/CommonPhotos/oziaadja2tj7igksdi0h.png",
                            fit: BoxFit.cover),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPassword()),
                        );
                      },
                    ),
                    const Text('12th Books'),
                  ]),
                  const SizedBox(width: 100),
                  Column(children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 2.0, // Border width
                          ),
                          //  borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                            "https://res.cloudinary.com/dlpxw0zdc/image/upload/v1712926857/CommonPhotos/xkstzpsqspntwob1shcm.png",
                            fit: BoxFit.cover),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPassword()),
                        );
                      },
                    ),
                    const Text('12th Papers'),
                  ]),
                ],
              ),
            ],
          )),
        ));
  }
  }
  
