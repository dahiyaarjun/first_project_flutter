import 'dart:convert';

import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/custom_helper/constants.dart';
import 'package:first_project_flutter/models/search_model.dart';
import 'package:first_project_flutter/pages/profileSettings.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Search extends StatefulWidget {
  @override
  State<Search> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Search> {
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

  final TextEditingController _message = TextEditingController();
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        // height: 500,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder(
                future:
                    apiResponse.apiSearch(context: context, message: message),
                builder: (BuildContext context,
                    AsyncSnapshot<SearchModel> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Lottie.asset('assets/images/2.json',
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          reverse: false,
                          repeat: true,
                          fit: BoxFit.cover);

                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Expanded(
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.white,
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.01,
                                right: MediaQuery.of(context).size.width * 0.01,
                                top: MediaQuery.of(context).size.height * 0.1,
                                // bottom:
                                //     MediaQuery.of(context).size.height *
                                //         0.1
                              ),
                              child: SingleChildScrollView(
                                  child: Text(
                                '${snapshot.data?.content}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                            ),
                          ),
                        );
                      } else {
                        return const Text('NO DATA FOUND');
                      }
                    default:
                      return const Text('NO DATA FOUND');
                  }
                },
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _message,
                          decoration: InputDecoration(
                              hintText: 'How can I help you?',
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff1a80e5))),
                              hintStyle:
                                  const TextStyle(color: Color(0xff788998)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffe8ecf1))),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.025,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.018),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.amber[400],
                        child: IconButton(
                            onPressed: () {
                              message = _message.text;
                              _message.clear();

                              setState(() {});
                            },
                            icon: Icon(Icons.send_sharp)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
