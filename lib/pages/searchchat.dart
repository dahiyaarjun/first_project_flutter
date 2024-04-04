import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/models/LoginDetails_model.dart';
import 'package:first_project_flutter/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Search> {
  
  // String ans= apiResponse.apiUserDetails(email:"dahiyaarjun343@gmail.com") as String;
  
  

  
  final TextEditingController _message = TextEditingController();
  String message="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        // elevation: 100,
     ),
  drawer: Drawer(
    
    child: ListView(
      padding: EdgeInsets.zero,
      children:  <Widget>[
        SizedBox(
          height: 250,
          
          child: DrawerHeader(
            
            decoration: BoxDecoration(
              color: Colors.blue,
              
              
              
            ),
            child: Column(
              children: [
             CircleAvatar(
                        radius: 60.0,
                        backgroundColor: const Color(0xFF778899),
                        backgroundImage: AssetImage("assets/images/Screenshot 2023-11-03 215652.png"),
                       
                        
            
                      ),
                      
             Text('Akshit',
              
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Text(
              'Demo@gmail.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
              ],
            ),
            
          ),
        ),
        
        
        ListTile(
          leading: Icon(Icons.account_circle),
          
          title: Text('Profile Settings'),
          onTap: () => Navigator.pushNamed(context, 'Setting'),
        ),
         ListTile(
          leading: Icon(Icons.logout_rounded),
          title: Text('Sign Out'),
          onTap: () {
            showDialog(context: context,
             builder: (_)=>AlertDialog(
              content: Text("Do you really want to Sign Out?"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel')),
                TextButton(onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
          
                await pref.clear();
                Navigator.pushNamed(context, 'login');
               setState(() {

               });
                }, child: Text('OK')),
              ],



            ));
            
          
          
         },
        ),

          
          
          
        
      ],
    )),
  
  


      body: Container(
        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        // height: 500,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FutureBuilder(
                future: apiResponse.apiSearch( context: context, message: message),
                builder: (BuildContext context, AsyncSnapshot<SearchModel> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Lottie.asset('assets/images/2.json',
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
                          reverse: false,
                          repeat: true,
                          fit: BoxFit.cover);

                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Expanded(
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.white,
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.01,
                                right: MediaQuery.of(context).size.width * 0.01,
                                top: MediaQuery.of(context).size.height * 0.1,
                                // bottom:
                                //     MediaQuery.of(context).size.height *
                                //         0.1
                              ),
                              child: SingleChildScrollView(
                                  child: Text(
                                '${snapshot.data?.content}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                            ),
                          ),
                        );
                      } else {
                        return const Text('NO DATA FOUND');
                      }
                    default:
                      return const Text('NO DATA FOUND');
                  }
                },
              ),


              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                ),
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
                      message=_message.text;
                      _message.clear();
                      
                            setState(() {
      
                            });
                    },
                    icon: Icon(Icons.send_sharp)),
                    
                    
                      
                  ),
                ),
                
                
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
