import 'package:first_project_flutter/pages/login.dart';
import 'package:first_project_flutter/models/loginmodel.dart';
import 'package:first_project_flutter/pages/loginGpt.dart';
import 'package:first_project_flutter/pages/practice.dart';
import 'package:first_project_flutter/pages/register.dart';
// import 'package:first_project_flutter/reset_pass.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=>const UserLogin(),
      'login_gpt': (context)=>const LoginScreen(),
      'register': (context)=>const UserRegister(),
      'practice': (context)=>const Practice(),
      // 'ResetPassword': (context)=>ResetPassword(),
      // 'model_user_login': (context)=>ModelUserLogin(),
    },
  ));
}
