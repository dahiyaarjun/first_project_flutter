import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/custom_helper/colors.dart';
import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  Future<void> login() async {
    await apiResponse().apiUserLogin(
        context: context, email: emailC.text, password: passwordC.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learning App',            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.white),
          ),backgroundColor: AppColors.DarkPurple,
                centerTitle: true,
      automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0,left: MediaQuery.of(context).size.width *0.0),
              child: Lottie.asset('assets/videos/LoginBulb.json',
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  reverse: true,
                  repeat: true,
                  fit: BoxFit.cover),
            ),
            SingleChildScrollView(
              child: Container(
                // padding: EdgeInsets.only(
                //     top: MediaQuery.of(context).size.height * 0.45,
                //     left: 35,
                //     right: 35),
                              margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.48,
              // bottom: MediaQuery.of(context).size.height * 0.01,
              left: MediaQuery.of(context).size.width * 0.015,
              right: MediaQuery.of(context).size.width * 0.015),
                     width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.42,
                            decoration: BoxDecoration(   
                            color: Colors.blueAccent, 
                            border: Border.all( 
                              color: Colors.white, 
                              width: 2.0, 
                            ), 
                            borderRadius: BorderRadius.circular(10.0), 
                            gradient: LinearGradient( 
                              colors: [ 
                                Colors.white, 
                                Colors.white 
                              ] 
                            ), 
                            boxShadow: [ 
                              BoxShadow( 
                                color: Colors.grey , 
                                blurRadius: 2.0, 
                                // offset: Offset(4.0,4.0) 
                              ) 
                            ],
                            ) ,
                child: Column(
                  children: [
                    Form(
                        key: _formkey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.068),
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailC,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter email';
                                  }
                                  final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                                  if (!emailRegex) {
                                    return 'Please Enter valid email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: const Color(0XFFfafbfd),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.purple)),
                                    hintStyle: const TextStyle(
                                        color: Color(0xff788998)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xffe8ecf1))),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.018),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)))),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: passwordC,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                  final regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value);
                                  if (!regex) {
                                    return 'Please Enter valid password';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.purple)),
                                    filled: true,
                                    fillColor: const Color(0XFFfafbfd),
                                    hintStyle: const TextStyle(
                                        // fontFamily: AppFonts.Poppins_Medium,
                                        color: Color(0xff788998)),
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xffe8ecf1))),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.018),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)))),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                                      padding: EdgeInsets.only(
                    // top: MediaQuery.of(context).size.height * 0.45,
                    left: 25,
                    right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              color: AppColors.DarkPurple,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.DarkPurple,
                            child: IconButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    login();
                                  }
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                                                            padding: EdgeInsets.only(
                    // top: MediaQuery.of(context).size.height * 0.45,
                    left: 10),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'ResetPassword');
                              },
                              child: const Text('forgot password?')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.7,
                  left: MediaQuery.of(context).size.width * 0.7),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.27,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: Text('Register',style: TextStyle(fontSize: 13, color: AppColors.DarkPurple),)),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(
            //       bottom: MediaQuery.of(context).size.height * 0.81,
            //       left: MediaQuery.of(context).size.width * 0.3),
            //   child: OutlinedButton(
            //       onPressed: () {
            //         Navigator.pushNamed(context, 'standard');
            //       },
            //       child: const Text('Skip->')),
            // ),
          ],
        ),
      ),
    );
  }
}