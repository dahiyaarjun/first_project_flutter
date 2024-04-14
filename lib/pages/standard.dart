import 'dart:convert';

import 'package:first_project_flutter/custom_helper/constants.dart';
import 'package:first_project_flutter/pages/profileSettings.dart';
import 'package:first_project_flutter/pages/resetPassword.dart';
import 'package:first_project_flutter/pages/searchchat.dart';
import 'package:first_project_flutter/pages/subject.dart';
import 'package:first_project_flutter/widgets/drawer.dart';
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
  
  @override
  initState() {
    MyDrawer();
  }

  String Class = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Library",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        drawer: MyDrawer(),
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
  
