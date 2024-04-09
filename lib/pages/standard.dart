import 'package:first_project_flutter/models/loginDetails_model.dart';
import 'package:first_project_flutter/pages/resetPassword.dart';
import 'package:first_project_flutter/pages/subject.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class standard extends StatelessWidget {
  const standard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Select Your Class",style:TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 30.0,
              color: Colors.white 
            ),) ,
      centerTitle: true,
        backgroundColor: Colors.blueGrey,),
      body:Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 160, 203, 239)),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   GestureDetector(
                     child: Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      height:MediaQuery.of(context).size.height*0.3,
                      decoration: BoxDecoration(color: Colors.black,
                      border: Border.all(
                                     color: Colors.black, // Border color
                                     width: 2.0, // Border width
                                   ),
                                  //  borderRadius: BorderRadius.circular(20),
                                 ),
                     child: Image.network("data:image/jpeg;base64,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",
                     fit: BoxFit.cover),
                     ),
                     onTap:() {
                        Navigator.push(context,
              MaterialPageRoute(builder: (context) => subject()),);
                     },
                     ),
                     const SizedBox(width: 100),
                     GestureDetector(
                     child:Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      height:MediaQuery.of(context).size.height*0.3,
                      decoration:BoxDecoration(color: Colors.black,
                       border: Border.all(
                                     color: Colors.black, // Border color
                                     width: 2.0, // Border width
                                   ),),
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqMiD1LWsw1cVxv6gKjI8OSg-khn4FcQzJVA&s",
                      fit: BoxFit.cover), 
                      ),
                       onTap:() {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => subject()),);
                     },
                     )
                     ],
                   
                 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   GestureDetector(
                     child: Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      height:MediaQuery.of(context).size.height*0.3,
                      decoration: BoxDecoration(color: Colors.black,
                      border: Border.all(
                                     color: Colors.black, // Border color
                                     width: 2.0, // Border width
                                   ),
                                  //  borderRadius: BorderRadius.circular(20),
                                 ),
                     child: Image.network("data:image/jpeg;base64,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",
                     fit: BoxFit.cover),
                     ),
                     onTap:() {
                        Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResetPassword()),);
                     },
                     ),
                     const SizedBox(width: 100),
                     GestureDetector(
                     child:Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      height:MediaQuery.of(context).size.height*0.3,
                      decoration:BoxDecoration(color: Colors.black,
                       border: Border.all(
                                     color: Colors.black, // Border color
                                     width: 2.0, // Border width
                                   ),),
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqMiD1LWsw1cVxv6gKjI8OSg-khn4FcQzJVA&s",
                      fit: BoxFit.cover), 
                      ),
                       onTap:() {
                        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResetPassword()),);
                     },
                     )
                     ],
                   
                 
          ),
          ],)
        ),
      )
    );
  }
}