import "package:flutter/material.dart";

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/peakpx 3.jpg'), fit: BoxFit.cover)
      ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 22,top: 100),
              child: Text('Welcome\nTo Demo App',
                style: TextStyle(color: Colors.blue,fontSize: 33),
              ),
            ),
            SingleChildScrollView(
                child:Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,left: 35,right: 35),
                  child: Column(
                    children: [
                      TextField(
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
                                onPressed: (){}, 
                                icon: Icon(Icons.arrow_forward)),
                            )
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, 'register');
                          }, child: Text('SIGNUP')
                          )
                        ],
                      ),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
