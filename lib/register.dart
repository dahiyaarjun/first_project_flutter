import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[ 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Container(
            width: 200,
            height: 150,
            color: Colors.amber,
            child: Text('Register Page',style: TextStyle(color: Colors.black,fontSize:50)),
          
          ),
        ],
          ),
       Row(
        children: [
          Container(
            color: Colors.black,
          child:Text('Welcome\nTo Demo App',style: TextStyle(color:Colors.blue,fontSize: 50)),
          )
          ],

        ),
        
        Row(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                fillColor: Colors.yellow,
                filled: true,

              border:OutlineInputBorder(borderRadius: BorderRadius.circular(10))
            )
            )
          ],
        
        ),
        ],

       ),
       




    );
  }
}