import 'dart:io';

import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           // decoration: const BoxDecoration(
            // image: DecorationImage(image: AssetImage('assets/images/peakpx 3.jpg'), fit: BoxFit.cover)
           // ),
            
           body: Center(
              child: Container(
                
                width: 500,
                height: 500,
                color: Colors.black,
                // ElevatedButton(onPressed: (){
                //             Navigator.pushNamed(context, 'register');
                //           }, child: Text('SIGNUP')
                // ),
                )
                // child:Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                //  children:[Column(
                 //mainAxisAlignment: MainAxisAlignment.end,
                 //crossAxisAlignment: ,
                 
                  
                  //children:[
                  // [Image.asset('assets/images/Screenshot 2023-11-03 215652.png'),
                //  Text('Jaat',style: TextStyle(fontSize: 50,color:Colors.red)),
                //  child:InkWell(onTap:() {
                //   print('dfghj');
                //   },
                //   child:Container(
                  
                //   color: Colors.blue,height:200,width:200
                  
                  
                //   ),
                //   ),

                //  ElevatedButton(onPressed: (){
                            
                //           }, child: Text('practice')
                //           )]
                //  )]
              ),
              
               
              
            
          
    );
  }
}

