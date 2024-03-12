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
  bool reg =true;
  
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();
 
    // TODO: implement dispose
    
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
      
   
          appBar: AppBar(
            centerTitle: true,
        title: const Text("Register Page"),
        backgroundColor: Colors.greenAccent[400],
        elevation: 50.0,
        
      ), 
      
      body: SingleChildScrollView(
      child:Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          const SizedBox(height: 50,),
          Container(
            padding: EdgeInsets.only(left: 35),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Welcome\nTo Demo App',
                  style: TextStyle(color: Colors.blue, fontSize: 30)),
            ],
          ),
          ),
          const SizedBox(height:30),
            Container(
             
              width: 2000,
              padding: EdgeInsets.only(left: 35,right: 35),
              child:TextField(
                
                controller: nameC,
                
                
                  decoration: InputDecoration(
                    
                      hintText: 'Name',
                      
                      fillColor: Colors.yellow,
                      filled: true,
                      prefixIcon: Icon(Icons.person,color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.blue,width: 2),borderRadius: BorderRadius.circular(20)
                          ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                          ),
                          
                        
                          )
                          )),
                        const SizedBox(height: 20),
            Container(
             
              width: 2000,
              padding: EdgeInsets.only(left: 35,right: 35),
              child:TextField(
                
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
                          )),
                        const SizedBox(height: 20),  
                        Container(
                          padding: EdgeInsets.only(left: 35,right: 35),
              child:TextField(
                
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
             ),
              // confirmPass=true;
              

                const SizedBox(height: 20),

                        Container(
                          padding: EdgeInsets.only(left: 35,right: 35),
                          child:TextField(
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
                       
                       ),
                        ),

              const SizedBox(height: 40),
              ElevatedButton(onPressed: () {
                String name=nameC.text.toString();
                String email=emailC.text.toString();
                String password=passwordC.text.toString();
                String confirmPassword=confirmPasswordC.text.toString();
                print("start");
                var a=apiResponse.apiUserRegistration(name,email,password,confirmPassword);
                print("stop");
                print(a);
              },
              child: Text('Register',style: TextStyle(color: Colors.purple,fontSize: 22)),
              style: ButtonStyle(
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return Colors.redAccent; //<-- SEE HERE
        return Colors.green; // Defer to the widget's default.
      },
    )),
              ),
        const SizedBox(height: 50),
       Container(
        padding: EdgeInsets.only(left: 35),
       child:Row(
        children: [
          
          Text('Already a user?',style: TextStyle(color: Colors.blueGrey),),
        ],
       ),
          
         
        ),
        Container(
          padding: EdgeInsets.only(left: 35),
        child:Row(
          children: [
            ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, 'login');
            
            },
            child: Text('login',style: TextStyle(color: Colors.black),),
            style: ButtonStyle(
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return Colors.redAccent; //<-- SEE HERE
        return Colors.green; // Defer to the widget's default.
      },
      )),
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
