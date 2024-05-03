import 'package:first_project_flutter/backend/sharedPreference.dart';
import 'package:first_project_flutter/pages/login.dart';
import 'package:first_project_flutter/pages/register.dart';
import 'package:first_project_flutter/pages/resetPassword.dart';
import 'package:first_project_flutter/pages/searchchat.dart';
import 'package:first_project_flutter/pages/standard.dart';
import 'package:flutter/material.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await SharedPreferencesHelper.getAccessToken();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: token != null ? 'standard' : 'login',
    routes: {
      // '/':(context)=>const splashScreen(),
      'login': (context) => const UserLogin(),
      'register': (context) => const UserRegister(),
      'ResetPassword': (context) => const ResetPassword(),
      'Search': (context) =>  Search(), 
      'standard':(token)=> standard(),
    },
  ));
}