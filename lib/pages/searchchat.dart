import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/models/search_model.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:lottie/lottie.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Search> {
  TextEditingController _message=TextEditingController(text: "hello");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGpt'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        // elevation: 100,

      ),
      


      body:Container(
      
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          
          // height: 500,
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
              
                 
                    FutureBuilder(future: apiResponse.apiSearch(context: context, message: _message.text),
                   builder: (BuildContext context,AsyncSnapshot<SearchModel>snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        
                        return Lottie.asset('assets/images/2.json',height: MediaQuery.of(context).size.height * 0.05,width: MediaQuery.of(context).size.width*0.5,reverse: false,repeat: true,fit: BoxFit.cover);
                       } else if (snapshot.hasError) {
                        
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // If data is successfully loaded, display the fetched data
                        print(snapshot.data?.content);
                        return 
                         Expanded(child:
                               SingleChildScrollView(
                               
                               child:Center(
                               child: Container(
                                padding: EdgeInsets.only(left: 40,right: 40),
                                child: Text('${snapshot.data?.content}',style: TextStyle(color: Colors.white,fontSize: 18),)
                               ),
                               
                                       
                               
                               ),
                        ),
                        );
                      }
                   },
                   ),
              
                 
              // },
                
                
                    
                Container(
                  // color: Colors.green,
                padding: EdgeInsets.only(left: 20,right: 20),
                
                // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                
                
                Expanded(
                  
                
                
                child:Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _message,
                      
                    decoration: InputDecoration(
                                    hintText: 'How can I help you?',
                                    filled: true,
                                    fillColor: Colors.white,
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
                ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.amber[400],
                    
                    child: IconButton(onPressed: (){
                            setState(() {
                              
                            });
                    },
                    icon: Icon(Icons.send_sharp)),
                    
                    
                      
                  ),
                ),
                
                  
                    
                // ),
                  ],
                ),
                                    ),
              ],
            ),
          ),
        // ),
      
      
      
      
      
      
      
      // ),
              
            ),



    );
  }
}