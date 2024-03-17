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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 22, top: 100),
          color: Colors.lightBlueAccent,
          child: SingleChildScrollView(
              child: Column(
            children: [
              // SizedBox(height: 100,),

              Row(
                children: [
                  Text(
                    'You are resetting password for:',
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                  Text(
                    '${widget.email}',
                    style: TextStyle(color: Colors.green, fontSize: 25),
                  ),
                ],
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
                                    return null;
                                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.025,
                        vertical: MediaQuery.of(context).size.height * 0.018),
                    hintText: 'newpassword',
                    
                  )),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              TextFormField(
                controller: passconfirmC,
                 validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Confirm Password';
                                    }
                                    return null;
                                  },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.025,
                      vertical: MediaQuery.of(context).size.height * 0.018),
                  hintText: 'confirmpassword',
                ),
              ),

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
                      horizontal: MediaQuery.of(context).size.width * 0.025,
                      vertical: MediaQuery.of(context).size.height * 0.018),
                  hintText: 'OTP',
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
