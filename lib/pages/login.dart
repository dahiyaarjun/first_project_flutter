import 'package:first_project_flutter/backend/laravel.dart';
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
      appBar: AppBar(title: const Text('Demo App'),backgroundColor: Colors.blueAccent,
      automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0,left: MediaQuery.of(context).size.width *0.0),
              child: Lottie.asset('assets/videos/Login.json',
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  reverse: true,
                  repeat: true,
                  fit: BoxFit.cover),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45,
                    left: 35,
                    right: 35),
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
                                            color: Color(0xff1a80e5))),
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
                                            color: Color(0xff1a80e5))),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blueAccent,
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
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'ResetPassword');
                            },
                            child: const Text('Forgot Password?')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.81,
                  left: MediaQuery.of(context).size.width * 0.6),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  child: const Text('Register')),
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.81,
                  left: MediaQuery.of(context).size.width * 0.3),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'standard');
                  },
                  child: const Text('Skip->')),
            ),
          ],
        ),
      ),
    );
  }
}