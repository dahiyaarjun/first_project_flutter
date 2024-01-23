import 'package:first_project_flutter/login.dart';
import 'package:first_project_flutter/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=>UserLogin(),
      'register': (context)=>UserRegister()
    },
  ));
}
