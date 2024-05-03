import 'package:first_project_flutter/backend/laravel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late TextEditingController controller;
  bool b = true;
  bool reg = true;
  var status = 'load';
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();

  Future<void> register() async {
    await apiResponse().apiUserRegistration(
        context: context,
        name: nameC.text,
        email: emailC.text,
        password: passwordC.text,
        password_confirmation: confirmPasswordC.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Register Page"),
        backgroundColor: Colors.greenAccent[400],
        elevation: 50.0,
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              child: Lottie.asset('assets/images/2.json',repeat: false,reverse: true,height: MediaQuery.of(context).size.height*0.14,width: MediaQuery.of(context).size.width),
            
              ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children:[ Container(
              
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
              child: Text("WELCOME",style: TextStyle(fontSize: 40))),
        ]),
          const SizedBox(height: 20),
          
          SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25),
                // color: Colors.black,
                // height: MediaQuery.of(context).size.height*0.7,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.025,
                    left: 35,
                    right: 35),
                child: Column(
                  children: [ 
                    Form(
              key: _formkey,
            
              child: Column(
                children: [
                  Container(
                    width: 2000,
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        final nameRegex = RegExp('[a-zA-Z]').hasMatch(value);
                        if (!nameRegex) {
                          return 'Please Enter valid name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Name',
                          filled: true,
                          fillColor: const Color(0XFFfafbfd),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff1a80e5))),
                          hintStyle: const TextStyle(color: Color(0xff788998)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xffe8ecf1))),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.025,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.018),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 2000,
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: TextFormField(
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
                              borderSide: BorderSide(color: Color(0xff1a80e5))),
                          hintStyle: const TextStyle(color: Color(0xff788998)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Color(0xffe8ecf1))),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.025,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.018),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: TextFormField(
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
                        obscureText: b,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.password,
                                color: Colors.redAccent),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    b = !b;
                                  });
                                },
                                child: Icon((b
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                            filled: true,
                            fillColor: const Color(0XFFfafbfd),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1a80e5))),
                            hintStyle:
                                const TextStyle(color: Color(0xff788998)),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Color(0xffe8ecf1))),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.025,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.018),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))))),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: TextFormField(
                        controller: confirmPasswordC,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Confirm Password';
                          }
                          return null;
                        },
                        //enabled: confirmPass.value,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            //suffixIcon: IconButton(onPressed: (){},icon: Icon),
                  
                            prefixIcon: const Icon(Icons.password,
                                color: Colors.redAccent),
                            hintText: 'Confirm Password',
                            filled: true,
                            fillColor: const Color(0XFFfafbfd),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff1a80e5))),
                            hintStyle:
                                const TextStyle(color: Color(0xff788998)),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide:
                                    BorderSide(color: Color(0xffe8ecf1))),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.025,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.018),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))))),
                  ),
                ],
              ),
            ),
          
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                register();
              }
            },
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.redAccent; //<-- SEE HERE
                }
                return Colors.green; // Defer to the widget's default.
              },
            )),
            child: const Text('Register',
                style: TextStyle(color: Colors.black, fontSize: 22)),
          ),
          const SizedBox(height: 50),
                  ],
                ),
                )
                ),
  
        ],
      ),
    );
  }
}
