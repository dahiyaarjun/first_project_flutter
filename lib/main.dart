import 'package:first_project_flutter/login.dart';
import 'package:first_project_flutter/model_user_login.dart';
import 'package:first_project_flutter/practice.dart';
import 'package:first_project_flutter/register.dart';
// import 'package:first_project_flutter/reset_pass.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context)=>UserLogin(),
      'register': (context)=>UserRegister(),
      'practice': (context)=>Practice(),
      // 'ResetPassword': (context)=>ResetPassword(),
      // 'model_user_login': (context)=>ModelUserLogin(),
    },
  ));
}
