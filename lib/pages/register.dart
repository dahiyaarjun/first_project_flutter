import 'package:flutter/material.dart';

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
    // await apiResponse().userR(
    //     context: context, email: emailC.text, password: passwordC.text);
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
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Welcome\nTo Demo App',
                      style: TextStyle(color: Colors.blue, fontSize: 30)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    width: 2000,
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: emailC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name';
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
                          fillColor: Colors.yellow,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
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

                          fillColor: Colors.yellow,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(20)),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
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
                  style: TextStyle(color: Colors.purple, fontSize: 22)),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: const Row(
                children: [
                  Text(
                    'Already a user?',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
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
                    child: const Text(
                      'login',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
