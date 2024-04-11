import 'package:first_project_flutter/backend/sharedPreference.dart';
import 'package:first_project_flutter/custom_helper/constants.dart';
import 'package:first_project_flutter/models/LoginDetails_model.dart';
import 'package:first_project_flutter/models/chapter_model';
import 'package:first_project_flutter/models/dummy_model.dart';
import 'package:first_project_flutter/models/registermodel.dart';
import 'package:first_project_flutter/models/responsemodel.dart';
import 'package:first_project_flutter/models/loginmodel.dart';
import 'package:first_project_flutter/models/search_model.dart';
import 'package:first_project_flutter/models/subjectmodel.dart';
import 'package:first_project_flutter/pages/practice.dart';
import 'package:first_project_flutter/pages/searchchat.dart';
import 'package:first_project_flutter/widgets/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: camel_case_types



class apiResponse {

  static String baseUrl = AppConstants.baseUrl;

  static Future<String> apiUserDetails({required String email}) async{

    try {
     
      String apiUrl = '${baseUrl}api/user/details';
      print('apiHit');
      var Response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email':"dahiyaarjun343@gmail.com"
          
        },
      );
      if(Response.statusCode==200){
       Map<String, dynamic> userData = jsonDecode(Response.body);
        
        print('arjun');

        print(userData['User Details'][0]['name']);
        String name=userData['User Details'][0]['name'];
       
        return name;
      }
      
      
    } catch (e) {
      // Utils.showSnackBar(context, e.toString());
      return Future.error(e.toString());
    }
    return Future.error("error");


  }

  static Future<SearchModel> apiSearch(
      {required BuildContext context, required String message}) async {
    try {
      if (message.isEmpty != true) {
        String apiUrl = "${baseUrl}api/user/open-ai";
        var Response = await http.post(
          Uri.parse(apiUrl),
          body: {'content': message},
        );
        if (Response.statusCode == 200) {
          // Map<String,dynamic>userData=jsonDecode(Response.body);
          // String successful = userData['content'];
          var jsonResponse = json.decode(Response.body);
          return SearchModel.fromJson(jsonResponse);
        }
      }
      return Future.error("Hii there!");
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
      return Future.error(e.toString());
    }
  }

  static Future<void> apiNewPassword(
      {required BuildContext context,
      required String email,
      required String password,
      required String password_confirmation,
      required String otp}) async {
    try {
      String apiUrl = '${baseUrl}api/user/reset/by-otp';
      var Response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation,
          'otp': otp
        },
      );

      if (Response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(Response.body);
        String successful = userData['message'];

        Utils.showSnackBar(context, successful);
      } else {
        Map<String, dynamic> errorMessage = jsonDecode(Response.body);
        String error = errorMessage['message'];
        Utils.showSnackBar(context, error);
      }
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
    }
  }

  Future<void> apiUserLogin({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      String apiUrl = '${baseUrl}api/user/login';
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(response.body);
        String msg = userData['message'];
        String status = userData['status'];
        String accessToken = userData['token'];
        await SharedPreferencesHelper.setAccessToken(accessToken);
        // print('Access Token come during Login Time' + accessToken);
        // await SharedPreferencesHelper.setAccessToken(accessToken);
        Utils.showSnackBar(context, msg);
        if (status == "Success") {
          Navigator.pushNamed(context,'Search');
        }
      } else {
        Map<String, dynamic> errorMessage = jsonDecode(response.body);
        String error = errorMessage['message'];
        Utils.showSnackBar(context, error);
      }
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
    }
  }

  Future<void> apiUserRegistration(
      {required BuildContext context,
      required String name,
      required String email,
      required String password,
      required String password_confirmation}) async {
    String apiUrl = '${baseUrl}api/user/register';
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": password_confirmation,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(response.body);
        String message = userData['message'];
        String status = userData['status'];
        Utils.showSnackBar(context, message);
        if (status == "Success") {
          Navigator.pushNamed(context, 'practice');
        }
      } else {
        Map<String, dynamic> userData = jsonDecode(response.body);
        String message = userData['message'];
        Utils.showSnackBar(context, message);
      }
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
    }
  }

  Future<void> apiResetPassword({
    required BuildContext context,
    required String email,
  }) async {
    try {
      String apiUrl = '${baseUrl}api/user/password-reset';
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: {'email': email},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(response.body);
        String successful = userData['message'];
        String token = userData['token'];
        int otp = userData['otp'];
        // print('Access Token come during Login Time' + accessToken);
        // await SharedPreferencesHelper.setAccessToken(accessToken);
        await Utils.showSnackBar(context, successful);
      } else {
        Map<String, dynamic> errorMessage = jsonDecode(response.body);
        String error = errorMessage['message'];
        Utils.showSnackBar(context, error);
      }
    } catch (e) {
      Utils.showSnackBar(context, e.toString());
    }
  }

  Future<Autogenerated> getFact() async {
    String url = "https://catfact.ninja/fact";

    print("chlgya");
    final response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    print("bad ka chlgya");

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return Autogenerated.fromJson(jsonResponse);
      // print(jsonResponse);
    } else {
      print('server error');
      return Future.error("glt");
    }
    // return obj;
  }

  static Future<List<ResponseModel>> fetchData() async {
    // Replace this URL with your API endpoint
    final response = await http.get(Uri.parse(
        'https://violent-wall-production.up.railway.app/api/user/all'));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((json) => ResponseModel.fromJson(json)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> uploadImage(Uint8List bytes,String email,String filename,String name) async {
    var request =  http.MultipartRequest('POST', Uri.parse('${baseUrl}api/user/upload-img'));
    request.fields['email'] = email;
    request.fields['name'] = name;
    var multiport =  http.MultipartFile('file', http.ByteStream.fromBytes(bytes), bytes.length,filename: filename);
    request.files.add(multiport);
    final response = await request.send();
    if(response.statusCode == 200){
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
    }else{
      return null;
    }
  }

  static Future<void> removeImage(String email) async{
    
    try {
  String apiUrl='${baseUrl}api/user/remove-img';
    
    var Response = await http.post(
      Uri.parse(apiUrl),
      body: {
        "email":email
      },
    );
  
    if (Response.statusCode == 200) {
      Map<String, dynamic> userData = jsonDecode(Response.body);
      String message= userData['message'];
      if(message=="successful"){
        print("remove kr dia");
      }
  
      
    } else {
      Map<String, dynamic> errorMessage = jsonDecode(Response.body);
      String error = errorMessage['message'];
      // Utils.showSnackBar(context, error);
    }
} on Exception catch (e) {
  print(e.toString());
  // TODO
}
    
    
    }

    static Future<List<subjectmodel>> getSubject(String Class) async {
    String Url='${baseUrl}api/user/get-subjects';
    final response = await http.post(Uri.parse(
        Url),
         body: { "class":Class
              //  "branch":null
               },
        );
         
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((json) => subjectmodel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<chapterModel>> getChapters(String _class,String _branch,String _subject) async {
    String Url='${baseUrl}api/user/get-chapters';
    final response = await http.post(Uri.parse(
        Url),
         body: { 
                  "class": _class,
                  "subject": _subject,
                  "branch": _branch
              
               },
        );
         
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final data = json.decode(response.body) as List<dynamic>;
      return data.map((json) => chapterModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<void> updateName(String email,String name) async{
    
    try {
  String apiUrl='${baseUrl}api/user/update-name';
    
    var Response = await http.post(
      Uri.parse(apiUrl),
     body:  {
    "email":email,
     "name":name
    },
    );
  
    if (Response.statusCode == 200) {
      Map<String, dynamic> userData = jsonDecode(Response.body);
      String message= userData['message'];
      if(message=="successful"){
        print("name updated");
      }
  
      
    } else {
      Map<String, dynamic> errorMessage = jsonDecode(Response.body);
      String error = errorMessage['message'];
      // Utils.showSnackBar(context, error);
    }
} on Exception catch (e) {
  print(e.toString());
  // TODO
}
    
    
    }
  }
  

