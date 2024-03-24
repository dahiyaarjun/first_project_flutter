import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Utils {
  static Future<void> showSnackBar(
    BuildContext context,
    String message,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Lottie.asset('assets/images/2.json')
            // child: const CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            // ),
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.01,
          // ),
          Expanded(child: Text(message,style:const TextStyle(color: Colors.black)))
        ],
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.white,
    ));
  }
  
}