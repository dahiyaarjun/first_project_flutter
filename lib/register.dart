import 'package:first_project_flutter/backend/laravel.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  late TextEditingController controller;
  bool b=true;
  bool confirmPass=true;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();
  @override
  void initState(){
    super.initState();
    controller=TextEditingController();
    controller.addListener(() {
      final confirmPass=controller.text.isNotEmpty;
      setState(() {
        this.confirmPass=confirmPass;
      });
     });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    //  appBar: AppBar(
    //     title: const Text('GeeksforGeeks'),
    //     elevation: 2,
    //   ), 
          appBar: AppBar(
            centerTitle: true,
        title: const Text("Register Page"),
        backgroundColor: Colors.greenAccent[400],
        elevation: 50.0,
        //actions: <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.comment),
          //   //tooltip: 'Comment Icon',
          //   onPressed: () {},
          // ), //IconButton
          // IconButton(
          //   icon: const Icon(Icons.settings),
          //   tooltip: 'Setting Icon',
          //   onPressed: () {},
          // ), //IconButton
       // ], //<Widget>[]
        
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   tooltip: 'Menu Icon',
        //   onPressed: () {},
        // ),
        // systemOverlayStyle: SystemUiOverlayStyle.light,
      ), 
      
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Welcome\nTo Demo App',
                  style: TextStyle(color: Colors.blue, fontSize: 30)),
            ],
          ),
            const SizedBox(height: 30),
              TextField(
                controller: emailC,
                
                
                  decoration: InputDecoration(
                    
                      hintText: 'Email',
                      
                      fillColor: Colors.yellow,
                      filled: true,
                      prefixIcon: Icon(Icons.email,color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.blue,width: 2),borderRadius: BorderRadius.circular(20)
                          ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                          ),
                          
                        
                          )
                          ),
                        const SizedBox(height: 20),  
              TextField(
                
                obscureText: b,
                obscuringCharacter: "*",
                  decoration: InputDecoration(
                    
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password,color: Colors.redAccent),
                     suffixIcon: GestureDetector(
            
            onTap: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   b = !b;
               });
             },
             child: Icon((b?Icons.visibility_off:Icons.visibility)
            )),
            

                      fillColor: Colors.yellow,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.blue,width: 2),borderRadius: BorderRadius.circular(20),
                          ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                          ),
                          
              )
              
              ),
              // confirmPass=true;
              

                const SizedBox(height: 20),
                          TextField(
                            controller: confirmPasswordC,
                            //enabled: confirmPass.value,
                obscureText: true,
                obscuringCharacter: "*",
                  decoration: InputDecoration(
                    //suffixIcon: IconButton(onPressed: (){},icon: Icon),
                    
             
            prefixIcon: Icon(Icons.password,color: Colors.redAccent),
                   
                      hintText: 'Confirm Password',
                      
                      fillColor: Colors.yellow,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.blue,width: 2),borderRadius: BorderRadius.circular(20)),
                
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                          ),
                          disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
              
                       )
                      // controller: controller,
                       ),

              const SizedBox(height: 40),
              TextButton(onPressed: confirmPass?() {
                setState(() {
                  confirmPass=false;
                  controller.clear();
                });

              }:null, child: Text('Register',style: TextStyle(color: Colors.green),selectionColor: Colors.black),
              )
        ],
      ),
    );
  }
}
