import 'dart:async';

import 'package:first_project_flutter/pages/login.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

// ignore: camel_case_types
class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();


Timer(const Duration(seconds: 1), () {
  Navigator.pushReplacement(
    context,MaterialPageRoute(
    builder:(context)=>const UserLogin()
    //  initialRoute: token != null ? 'Search' : 'login',
    ));
 });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        color: Colors.amber,
        child: Center(
          // child: Image.asset("assets/images/idea.png"),
        ),
      )
      );
    
  }
}


