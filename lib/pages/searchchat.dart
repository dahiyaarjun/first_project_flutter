import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGpt'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        elevation: 10,

      ),
      


      body:SingleChildScrollView(
        child: Container(
          
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // height: 500,
              color: Colors.black,
              child: Center(
                child: Column(
                  children: [
                    
                        
                    Container(
                      // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*1.5),
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                      
                      
                      Expanded(
                      
                      
                      child:Container(
                        // margin: EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                            
                          decoration: InputDecoration(
                                          hintText: 'How can I help you',
                                          filled: true,
                                          fillColor: const Color(0XFFfafbfd),
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
                          
                          child: IconButton(onPressed: (){},
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
      ),



    );
  }
}