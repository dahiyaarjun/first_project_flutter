import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/pages/newpassword.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
    TextEditingController emailC = TextEditingController();
    Future<void> resetPassword() async {
    await apiResponse().apiResetPassword(
        context: context, email: emailC.text);
  }
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text('Reset Page'),
      ),
      body:SingleChildScrollView(
     child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  Container(
                    child: Text('Reset Password',style: TextStyle(fontSize: 50),),
                    
                  ),  
            ],
           
          ),
          const SizedBox(height: 50),
          Padding(padding: EdgeInsets.all(50),
         child: Text('Enter the email address associated with your account and we will send you a link to reset your password.',style:TextStyle(fontSize: 25),maxLines: 3,),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding:EdgeInsets.only(left:35) ,
             child: Text('Email',style:TextStyle(fontSize: 25),),
           ),
            ],
          ),
          const SizedBox(height: 10),
          
          
          Form(
            key: _formkey,
            child:Column(
            children: [
              Padding(padding: EdgeInsets.only(left: 35),
          
           child: TextFormField(
            controller: emailC,
            validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    return null;
                                  },
            decoration: InputDecoration(
              hintText: "enter email here",
              fillColor: Colors.yellow,
              // filled: true,
               prefixIcon: Icon(Icons.email,color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide(color: Colors.deepOrange,width:2),
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
          child:  ElevatedButton(onPressed: (){
            if (_formkey.currentState!.validate()) {
                                    resetPassword();
                                    String email=emailC.text;
            
            Navigator.of(
    context).push(
    MaterialPageRoute(
      builder: (context) => NewPassword(email: email),
    ));
                                  }
                    
            
            
            
             } , child: Text('Reset Password',style:TextStyle(fontSize: 30,color:Colors.blue),),),
      ),],
     ),
      )
      

    
     
    );
;
  }
}