import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  bool b=true;
  //dynamic confirmPass=false;
  ValueNotifier<bool> confirmPass = ValueNotifier<bool>(false);
  
  
  
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
              
                       )),

              const SizedBox(height: 40),
              ElevatedButton(onPressed: () {}, child: Text('Register',style: TextStyle(color: Colors.green),selectionColor: Colors.black),
              )
        ],
      ),
    );
  }
}
