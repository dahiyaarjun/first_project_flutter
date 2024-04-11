
import 'package:first_project_flutter/backend/sharedPreference.dart';
import 'package:first_project_flutter/pages/login.dart';
import 'package:first_project_flutter/models/loginmodel.dart';
import 'package:first_project_flutter/pages/loginGpt.dart';
import 'package:first_project_flutter/pages/newpassword.dart';
import 'package:first_project_flutter/pages/practice.dart';
import 'package:first_project_flutter/pages/profileSettings.dart';
import 'package:first_project_flutter/pages/register.dart';
import 'package:first_project_flutter/pages/resetPassword.dart';
import 'package:first_project_flutter/pages/searchchat.dart';
import 'package:first_project_flutter/pages/splash.dart';
import 'package:first_project_flutter/pages/standard.dart';
import 'package:first_project_flutter/pages/subject.dart';
import 'package:flutter/material.dart';
 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Check if token is available
  String? token = await SharedPreferencesHelper.getAccessToken();
   print(token);
  runApp(MaterialApp(
    
    debugShowCheckedModeBanner: false,
    initialRoute: token != null ? 'Search' : 'login',
    // initialRoute:'/',
    routes: {
      // '/':(context)=>const splashScreen(),
      'login': (context) => const UserLogin(),
      'login_gpt': (context) => const LoginScreen(),
      'register': (context) => const UserRegister(),
      'practice': (context) => const Practice(),
      'ResetPassword': (context) => const ResetPassword(),
      'Search': (context) =>  Search(), 
      'standard':(token)=> standard(),
      
      // Add more routes as needed
    },
  ));
}