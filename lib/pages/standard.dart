import 'package:first_project_flutter/custom_helper/colors.dart';
import 'package:first_project_flutter/pages/resetPassword.dart';
import 'package:first_project_flutter/pages/subject.dart';
import 'package:first_project_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class standard extends StatefulWidget {
  @override
  State<standard> createState() => _MyWidgetState();

  standard({super.key});
  
}

  class _MyWidgetState extends State<standard> {
  
  @override
  initState() {
    MyDrawer();
  }

  String Class = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Library",
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 28.0,
                color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: AppColors.DarkPurple,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.28,
              child: Lottie.asset('assets/videos/Library.json',
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  // reverse: true,
                  // repeat: true,
                  fit: BoxFit.cover),
            ),
            // SizedBox(height: 1,),
            Container(
              margin: EdgeInsets.only(
              // top: MediaQuery.of(context).size.height * 0.2,
              // bottom: MediaQuery.of(context).size.height * 0.099,
              left: MediaQuery.of(context).size.width * 0.015,
              right: MediaQuery.of(context).size.width * 0.015),
              width: MediaQuery.of(context).size.width * 0.99,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(   
               color: Colors.blueAccent, 
               border: Border.all( 
                 color: Colors.grey, 
                 width: 2.0, 
               ), 
               borderRadius: BorderRadius.circular(10.0), 
               gradient: LinearGradient( 
                 colors: [ 
                  Colors.white, 
                  Colors.white 
                 ] 
               ), 
              boxShadow: [ 
                BoxShadow( 
                  color: Colors.grey , 
                  blurRadius: 2.0, 
                  // offset: Offset(4.0,4.0) 
                ) 
              ],
              ) ,
              // decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                  child: Column(
                    
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white, // Border color
                                width: 2.0, // Border width
                              ),
                              //  borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                                "https://res.cloudinary.com/dlpxw0zdc/image/upload/v1712926813/CommonPhotos/xkgmsofihairtf0j4idm.png",
                                fit: BoxFit.cover),
                          ),
                          onTap: () {
                            Class = "10th";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => subject(Class)),
                            );
                          },
                        ),
                        const Text('10th Books'),
                      ]),
                      const SizedBox(width: 100),
                      Column(children: [
                        GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white, // Border color
                                width: 2.0, // Border width
                              ),
                            ),
                            child: Image.network(
                                "https://res.cloudinary.com/dlpxw0zdc/image/upload/v1712926843/CommonPhotos/blf64af2hfexvs7pyovg.png",
                                fit: BoxFit.cover),
                          ),
                          onTap: () {
                            Class = "10th";
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => subject(Class)));
                          },
                        ),
                        const Text('10th Papers'),
                      ]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white, // Border color
                                width: 2.0, // Border width
                              ),
                              //  borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                                "https://res.cloudinary.com/dlpxw0zdc/image/upload/v1712926823/CommonPhotos/oziaadja2tj7igksdi0h.png",
                                fit: BoxFit.cover),
                          ),
                          onTap: () {
                            Class = "12th";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => subject(Class)),
                            );
                          },
                        ),
                        const Text('12th Books'),
                      ]),
                      const SizedBox(width: 100),
                      Column(children: [
                        GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white, // Border color
                                width: 2.0, // Border width
                              ),
                              //  borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                                "https://res.cloudinary.com/dlpxw0zdc/image/upload/v1712926857/CommonPhotos/xkstzpsqspntwob1shcm.png",
                                fit: BoxFit.cover),
                          ),
                          onTap: () {
                            Class = "12th";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => subject(Class)),
                            );
                          },
                        ),
                        const Text('12th Papers'),
                      ]),
                    ],
                  ),
                ],
              )),
            ),
          ],
        ));
  }
  }
  
