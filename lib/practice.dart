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
            
                
                body:Container(
                  width: 1000,
                child:
                RichText(text: TextSpan(
                  style: TextStyle(color: Colors.red,fontSize: 20),
                  children: const<TextSpan>[
                    TextSpan(
                      text: 'Akshit\n',style: TextStyle(color: Colors.amber,fontSize: 20),
                      
                    ),
                    TextSpan(
                      text: 'chaudhary'
                    )

                  ]

                ),)
                ),
                
             
    );
  }
}

