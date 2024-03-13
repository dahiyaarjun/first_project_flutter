import "package:first_project_flutter/backend/laravel.dart";
import "package:first_project_flutter/model_user_login.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});


  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  apiResponse data=apiResponse();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Demo App',
      home: Scaffold(
        appBar: AppBar(title: Text('Demo APP')),
      body: Container(
      
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/peakpx 3.jpg'), fit: BoxFit.cover)
        ),
        child: Scaffold(
          //  backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 22,top: 100),
                child: Text('Welcome\nTo Demo App',
                // ),
                  style: TextStyle(color: Colors.blue,fontSize: 33),
                ),
              ),
              SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,left: 35,right: 35),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailC,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            fillColor: Colors.amber.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: passwordC,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.amber.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sign In',style: TextStyle(
                              color: Colors.amber,fontSize: 40,
                              fontWeight: FontWeight.bold,
                              ),),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.amber,
                                child: IconButton(
                                  onPressed: (){
                                    String email=emailC.text.toString();
                                    String password=passwordC.text.toString();
                                          FutureBuilder(future: data.getResponse(email,password), builder: (BuildContext context, AsyncSnapshot<ModelUserLogin>snapshot) {
                                          if(snapshot.hasData){
                                            print("success");
                                            return Container(
                                              height: 100,
                                              width: 100,
                                              color: Colors.blue,
                                              child: Text("Success")
                                              );
                                          }else{
                                            return Text("error");
                                          }
                                        });
                                  }, 
                                  icon: Icon(Icons.arrow_forward)),
                              )
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, 'register');
                            }, child: Text('SIGNUP')
                            ),
                            // ElevatedButton(onPressed: (){
                            //   Get.snackbar('snack', 'snack successfully');
                            // }, child: Text('show snackbar')
                            // ),
                            // ElevatedButton(onPressed: (){
                            //   Get.defaultDialog();
                            // }, child: Text('Alert')
                            // )
                          ],
                        ),
                      ],
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
      ),
    );
  }
}




// api call
      // child: FutureBuilder(future: data.getResponse(emailC,passwordC), builder: (BuildContext context, AsyncSnapshot<ModelUserLogin>snapshot) {
      //   if(snapshot.hasData){
      //     return 
      //   }
      // })),




// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(image: AssetImage('assets/images/peakpx 3.jpg'), fit: BoxFit.cover)
//       ),
//       child: Scaffold(
//         // backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 22,top: 100),
//               // child: Text('Welcome\nTo Demo App',
//               child: FutureBuilder<List>(
//                 future: data.getResponse('dahiyaarjun343@gmail.com','@Arjun343'), 
//                 builder: (context,snapshot){
//                   print(snapshot);
//                 }
//               // ),
//                 // style: TextStyle(color: Colors.blue,fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//                 child:Container(
//                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,left: 35,right: 35),
//                   child: Column(
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Email',
//                           fillColor: Colors.amber.shade100,
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8)
//                           )
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           hintText: 'Password',
//                           fillColor: Colors.amber.shade100,
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8)
//                           )
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Sign In',style: TextStyle(
//                             color: Colors.amber,fontSize: 40,
//                             fontWeight: FontWeight.bold,
//                             ),),
//                             CircleAvatar(
//                               radius: 30,
//                               backgroundColor: Colors.amber,
//                               child: IconButton(
//                                 onPressed: (){}, 
//                                 icon: Icon(Icons.arrow_forward)),
//                             )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           ElevatedButton(onPressed: (){
//                             Navigator.pushNamed(context, 'register');
//                           }, child: Text('SIGNUP')
//                           ),
//                           ElevatedButton(onPressed: (){
//                             Navigator.pushNamed(context, 'practice');
//                           }, child: Text('practice')
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
