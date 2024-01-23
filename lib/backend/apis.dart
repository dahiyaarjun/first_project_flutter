import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class apiResponse {
  Future<List> getResponse() async {
    String $baseUrl = 'https://127.0.0.1:8000/';
    String apiUrl = '${$baseUrl}api/user/login';
    try {
      var response = await http.get(Uri.parse(apiUrl));
      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        return json.decode(response.body);
      } else {
        // Print an error message if the request was not successful
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
