import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/custom_helper/colors.dart';
import 'package:first_project_flutter/pages/newpassword.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailC = TextEditingController();
  Future<void> resetPassword() async {
    await apiResponse().apiResetPassword(context: context, email: emailC.text);
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: AppColors.DarkPurple,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text('Reset Page',style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Lottie.asset('assets/videos/email.json',
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.7,
                  reverse: false,
                  repeat: true,
                  fit: BoxFit.cover),
                ),
              ],
            ),
            const SizedBox(height: 200),
            // Padding(
            //   padding: EdgeInsets.all(50),
            //   child: Text(
            //     'Enter the email address associated with your account and we will send you a link to reset your password.',
            //     style: TextStyle(fontSize: 25),
            //     maxLines: 3,
            //   ),
            // ),
            // const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Email',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5,right: 5),
                    child: TextFormField(
                      controller: emailC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                        if (!emailRegex) {
                          return 'Please Enter valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter email here",
                        fillColor: Colors.yellow,
                        // filled: true,
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:
                              BorderSide(color: AppColors.DarkPurple, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 50),
            Container(
              // color: Colors.blue,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    resetPassword();
                    String email = emailC.text;

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewPassword(email: email),
                    ));
                  }
                },
                child: Text(
                  'Send OTP',
                  style: TextStyle(fontSize: 20, color: AppColors.DarkPurple),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
    ;
  }
}
