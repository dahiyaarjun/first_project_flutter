import 'package:first_project_flutter/backend/laravel.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  String email;

  NewPassword({required this.email});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  Future<void> NewPassword() async {
    await apiResponse.apiNewPassword(
        context: context,
        email: widget.email,
        password: passC.text,
        password_confirmation: passconfirmC.text,
        otp: otpC.text);
  }
  bool b = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController passC = new TextEditingController();
  TextEditingController passconfirmC = new TextEditingController();
  TextEditingController otpC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var email=email;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("New Password Page"),
        backgroundColor: Colors.yellow[400],
        elevation: 50.0,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 22, top: 100),
          color: Colors.white10,
          child: SingleChildScrollView(
              child: Column(
            children: [
              // SizedBox(height: 100,),

              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: SingleChildScrollView(
                    // scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        // Text(
                        //   'You are resetting password for:',
                        //   style: TextStyle(color: Colors.red, fontSize: 20),
                        // ),
                        Text(
                          '${widget.email}',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              // Text('You are resetting password for: ${widget.email}'),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: passC,
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    TextFormField(
                        controller: passconfirmC,
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    TextFormField(
                      controller: otpC,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter OTP';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.025,
                            vertical:
                                MediaQuery.of(context).size.height * 0.018),
                        hintText: 'OTP',
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),

              ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      NewPassword();
                    }
                  },
                  child: Text('Submit'))
            ],
          ))),
    );
  }
}
