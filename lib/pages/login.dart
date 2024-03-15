import 'package:first_project_flutter/backend/laravel.dart';
import "package:flutter/material.dart";

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
    await apiResponse().userLogin(
        context: context, email: emailC.text, password: passwordC.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo APP')),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/imgBlueBackground.jpg'),fit: BoxFit.cover)),
        child: Scaffold(backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 22, top: 100),
                child: const Text('Welcome\nTo Demo App',style: TextStyle(color: Colors.blue, fontSize: 33),),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4,left: 35,right: 35),
                  child: Column(
                    children: [
                      Form(
                          key: _formkey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width *0.055),
                            child: Column(
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height *0.02,),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailC,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      filled: true,
                                      fillColor: const Color(0XFFfafbfd),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xff1a80e5))),
                                      hintStyle: const TextStyle(color: Color(0xff788998)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Color(0xffe8ecf1))),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)))),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  controller: passwordC,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
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
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.018),
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)))),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Sign In',style: TextStyle(color: Colors.amber,fontSize: 40,fontWeight: FontWeight.bold,),),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.amber,
                            child: IconButton(onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    login();
                                  }
                                },
                                icon: const Icon(Icons.arrow_forward)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(onPressed: () {
                                Navigator.pushNamed(context, 'register');
                              },
                              child: const Text('SIGNUP')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// final emailRegex =
//     RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
// if (!emailRegex.hasMatch(value)) {
//   return 'Please Enter valid email';
// }