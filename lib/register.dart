import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  bool b=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
             Container(
                color: Colors.green,
                width: 500,
                height: 50,
              child:Text('Register Page',
                  style: TextStyle(color: Colors.black, fontSize: 30)),
              
              ),
            ],
          ),
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
                  decoration: InputDecoration(
                    
                      hintText: 'Email',
                      
                      fillColor: Colors.yellow,
                      filled: true,
                      prefixIcon: Icon(Icons.email,color: Colors.redAccent),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:  Colors.blue),borderRadius: BorderRadius.circular(50)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
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
                          borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(50)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))
                          ),

                const SizedBox(height: 20),
                          TextField(
                obscureText: true,
                obscuringCharacter: "*",
                  decoration: InputDecoration(
                    //suffixIcon: IconButton(onPressed: (){},icon: Icon),
                    
             
            prefixIcon: Icon(Icons.password,color: Colors.redAccent),
                   
                      hintText: 'Confirm Password',
                      
                      fillColor: Colors.yellow,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(50)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),

              const SizedBox(height: 40),
              ElevatedButton(onPressed: () {}, child: Text('Register',style: TextStyle(color: Colors.green),selectionColor: Colors.black),
              ), 
              const SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, 'login');
                          }, child: Text('SIGNUP')
                          ),
        ],
      ),
    );
  }
}
