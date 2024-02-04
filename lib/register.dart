import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
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
              Text('Register Page',
                  style: TextStyle(color: Colors.black, fontSize: 30,backgroundColor: Colors.yellowAccent)),
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
                          borderSide: BorderSide(color: const Color.fromARGB(255, 243, 89, 33)),borderRadius: BorderRadius.circular(50)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
                        const SizedBox(height: 20),  
              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                  decoration: InputDecoration(
                    
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password,color: Colors.redAccent),
                      fillColor: Colors.yellow,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(50)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),

                const SizedBox(height: 20),
                          TextField(
                obscureText: true,
                obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password,color: Colors.redAccent),
                   // suffixIcon: IconButton(icon: Icon()),
                      hintText: 'Confirm Password',
                      
                      fillColor: Colors.yellow,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),borderRadius: BorderRadius.circular(50)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),

              const SizedBox(height: 40),
              ElevatedButton(onPressed: () {}, child: Text('Register',style: TextStyle(color: Colors.green)),
              )
        ],
      ),
    );
  }
}
