import 'dart:convert';
import 'dart:io';
import 'package:first_project_flutter/custom_helper/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:first_project_flutter/backend/laravel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: must_be_immutable
class Settings extends StatefulWidget {
  String email;
  Settings({super.key, required this.email});

  

  @override
  State<Settings> createState() => _MyWidgetState();

  
}

class _MyWidgetState extends State<Settings> {

TextEditingController _name=TextEditingController();


  @override
  initState() {
    
   UserDetails();
  }

String name="";
String img="";
String email="";
static String baseUrl = AppConstants.baseUrl;



  bool showSpinner = false;
  XFile? image;

  
  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile Settings'),
          centerTitle: true,
          backgroundColor: Colors.green,
          leading: BackButton(
            onPressed: () => Navigator.pushNamed(context, 'Search'),
            color: Colors.black,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.blue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  child: InkWell(
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            img != "null" ? NetworkImage(img) : null,
                        child:
                            img == "null" ? const Icon(Icons.person, size: 70) : null,
                      ),
                      onTap: () => {
                            editProfile(),
                          }),
                ),
                    
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                ElevatedButton(onPressed: () async {
                 editProfile();
                  
                }, child: Text('Edit Image')),
                Container(
                  padding: const EdgeInsets.all(40),
                  child: TextFormField(
                    controller: _name,
                    
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.030,
                          vertical: MediaQuery.of(context).size.height * 0.018),
                      hintText: 'Name',
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                ),
                    
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.10
                ),
                SizedBox(
                    width: 190,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () async {
                         
                           await save(_name.text);
                           
                          UserDetails();
                          setState(() async {
                           
                          });
                          print("save button");
                          
                          
                        },
                        
                        child: const Text('Save'))),
                    SizedBox(
                  height: MediaQuery.of(context).size.height*0.10
                ),
              ],
            ),
          ),
          
        ),
      ),
    );
  }

  UserDetails() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString('accessToken').toString();
      
       apiUserDetails(token:token);
  }

  Future<void> apiUserDetails({required String token}) async{

    try {
      
      String apiUrl = '${baseUrl}api/user/details';
      print('apiHit');
      var Response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'token':token
          
        },
      );
      if(Response.statusCode==200){
       Map<String, dynamic> userData = jsonDecode(Response.body);
        
    
        setState(() {
          email=userData['User Details'][0]['email'];
          name=userData['User Details'][0]['name'];
          _name.text=name;
          userData['url']==null?img="null":img=userData['url'];
          print(img);
          
        });
          
          
        print("user details called");
      }
    }
      catch(e){
        print(e.toString());

      }
      }

      Future<void> remove() async {
        setState(() {showSpinner = true;});
       await apiResponse.removeImage(email);
       setState(() {showSpinner = false;});
       print("image removed");
       
      }
  Future<void> save(String name) async{
  if (image != null) {
  setState(() {showSpinner = true;});
   Uint8List bytes =await image!.readAsBytes();
  await apiResponse().uploadImage(bytes,widget.email,image!.name,name).then((value) {
           setState(() {
           });
       print(value.toString());
       }).onError((error,stackTrace) {
       print(error.toString());
       });
       setState(() {showSpinner = false;});
       
     }
     else{
      setState(() {showSpinner = true;});
      await apiResponse.updateName(widget.email, name);
      setState(() {showSpinner = false;});
     }
     print("saved");
  }

  Future<void> editProfile()async {
    showModalBottomSheet(
                              context: context,
                              builder: (builder) {
                                return Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height / 6,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: InkWell(
                                                onTap: () async {
                                                  final ImagePicker picker = ImagePicker();
                                                   Navigator.pop(context);
                                                   image = await picker.pickImage(source: ImageSource.gallery);
                                                  
                                                  
                                                },
                                                child: const SizedBox(
                                                  child: Column(
                                                    children: [
                                                      Icon(Icons.image,
                                                          size: 70),
                                                      Text('Gallery')
                                                    ],
                                                  ),
                                                ))),

                                        Expanded(
                                            child: InkWell(
                                                onTap: () async {
                                                  final ImagePicker picker = ImagePicker();
                                                  Navigator.pop(context);
                                                   image = await picker.pickImage(source: ImageSource.camera);
                                                },
                                                child: const SizedBox(
                                                  child: Column(
                                                    children: [
                                                      Icon(
                                                          Icons.camera_alt_outlined,size: 70),
                                                      Text('Camera')
                                                    ],
                                                  ),
                                                ))),

                                               Expanded(
                                            child: InkWell(
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                 await remove();
                                                  UserDetails();
                                                },
                                                child: const SizedBox(
                                                  child: Column(
                                                    children: [
                                                      Icon(
                                                          Icons.edit,size: 70),
                                                      Text('Remove Image')
                                                    ],
                                                  ),
                                                ))),
                                      ],
                                    ),
                                  ),
                                );
                              });

  }
}
