import 'package:first_project_flutter/model_user_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class ApiLogin extends StatefulWidget {
//   const ApiLogin({super.key});

//   @override
//   State<ApiLogin> createState() => _ApiLoginState();
// }

// class _ApiLoginState extends State<ApiLogin> {
//     Future<ModelUserLogin> Userlogin(String email,String password) async{
//     // object
//     ModelUserLogin? modelUserLogin;
//     http.Response response= await http.post(
//       Uri.parse('https://10.0.2.2:8000/api/user/login'),
//       body: {
//         "email": email,
//         "password": password,
//       },
//     );
//     var jsonResponse = json.decode(response.body);
//     modelUserLogin = ModelUserLogin.fromJson(jsonResponse);
//     print(modelUserLogin);
//     return modelUserLogin;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

// ignore: camel_case_types
class apiResponse {
  Future<ModelUserLogin> getResponse(String email,String password) async {
    
    // local
    // String $baseUrl = 'https://127.0.0.1:8000/';
    
    // for emulator
    String $baseUrl = 'http://10.0.2.2:8000/';

    String apiUrl = '${$baseUrl}api/user/login';
    try {
      var response = await http.post(Uri.parse(apiUrl),
      body: {
        "email": email,
        "password": password,
      },
      );
      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        print(response.body);
        final data= json.decode(response.body);
        return ModelUserLogin.fromJson(data);
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  static apiUserRegistration(String name,String email,String password,String password_confirmation) async {
    
    // local
    // String $baseUrl = 'https://127.0.0.1:8000/';
    
    // for emulator
    String $baseUrl = 'http://10.0.2.2:8000/';

    String apiUrl = '${$baseUrl}api/user/register';
    try {
      var response = await http.post(Uri.parse(apiUrl),
      body: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
      },
      );
      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        return json.decode(response.body);
      } else {
        // Print an error message if the request was not successful
        return "Server Error";
      }
    } catch (e) {
      print(e);
      return "Failed";
    }
  }

  

  // Future<ModelUserLogin> Userlogin(String email,String password) async{
  //   // object
  //   ModelUserLogin? modelUserLogin;
  //   http.Response response= await http.post(
  //     Uri.parse('https://10.0.2.2:8000/api/user/login'),
  //     body: {
  //       "email": email,
  //       "password": password,
  //     },
  //   );
  //   var jsonResponse = json.decode(response.body);
  //   modelUserLogin = ModelUserLogin.fromJson(jsonResponse);
  //   print(modelUserLogin);
  //   return modelUserLogin;
  // }

}
