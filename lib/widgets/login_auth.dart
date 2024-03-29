

import 'package:first_project_flutter/backend/laravel.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  
  // Login_auth login_auth = Login_auth();
  
  
  
  
  
  Future<void> login() async {

    await apiResponse().apiUserLogin(
        context: context, email: email.text, password: password.text);
        
  }

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5fcfc),
      body: Container(
        // create: (context) {
        //   Password_Visibility_provider();
        // },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Text('Log in',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      color: Colors.black,
                      // fontFamily: AppFonts.Poppins_Medium
                      )
                      ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/peakpx 3.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Welcome to Innovixion Tech',
                style: TextStyle(
                    // fontFamily: AppFonts.Poppins_Medium,
                    fontSize: MediaQuery.of(context).size.height * 0.023,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Irure sunt quis magna adipisicing veniam anim Irure sunt quis magna adipisicing veniam anim',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // fontFamily: AppFonts.Poppins_Medium,
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Form(
                  key: _formkey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.055),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            // Regular expression for validating an email address
                            // This regex checks for basic email format, but it might not catch all possible invalid email formats
                            // For more comprehensive email validation, consider using a dedicated email validation package
                            // final emailRegex =
                            //     RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            // if (!emailRegex.hasMatch(value)) {
                            //   return 'Please Enter valid email';
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Email',
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff1a80e5))),
                              filled: true,
                              fillColor: const Color(0XFFfafbfd),
                              hintStyle: const TextStyle(
                                  // fontFamily: AppFonts.Poppins_Medium,
                                  color: Color(0xff788998)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffe8ecf1))),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.025,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.018),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        // Consumer<Password_Visibility_provider>(
                          // builder: (context, passwordvisible, _) {
                           TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            // Regular expression for validating an email address
                            // This regex checks for basic email format, but it might not catch all possible invalid email formats
                            // For more comprehensive email validation, consider using a dedicated email validation package
                            // final emailRegex =
                            //     RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                            // if (!emailRegex.hasMatch(value)) {
                            //   return 'Please Enter valid email';
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Password',
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff1a80e5))),
                              filled: true,
                              fillColor: const Color(0XFFfafbfd),
                              hintStyle: const TextStyle(
                                  // fontFamily: AppFonts.Poppins_Medium,
                                  color: Color(0xff788998)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffe8ecf1))),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.025,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.018),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                        ),
                          // },
                        // )
                      ],
                    ),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.035),
                  child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                            // MaterialPageRoute(
                            //     builder: (BuildContext context) =>
                                    // const ForgotPassword()));
                      },
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                            // fontFamily: AppFonts.Poppins_Medium,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.width * 0.057),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            backgroundColor: const Color(0xffe9eef2)),
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            login();
                          }
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              // fontFamily: AppFonts.Poppins_Medium,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.035,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            backgroundColor: const Color(0xff1a80e5)),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                              // MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                                      // const SignUp()));
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              // fontFamily: AppFonts.Poppins_Medium,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

