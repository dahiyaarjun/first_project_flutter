import 'dart:convert';
import 'dart:io';
import 'package:first_project_flutter/custom_helper/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:first_project_flutter/backend/laravel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
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
UserDetails() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString('accessToken').toString();
      // print("token is $token");
       apiUserDetails(token:token);
  }

  @override
  initState() {
    
   UserDetails();
  }

String name="";
String img="";
String email="";
static String baseUrl = AppConstants.baseUrl;


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
          img=userData['url'];
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
       await apiResponse.removeImage(email);
       print("image removed");
       
      }

       
  
  
  bool showSpinner = false;
  XFile? image;

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
     print("saved");
  }

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
          color: Colors.blue,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                child: InkWell(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          img != null ? NetworkImage(img) : null,
                      child:
                          img == null ? const Icon(Icons.person, size: 70) : null,
                    ),
                    onTap: () => {
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
                                      ],
                                    ),
                                  ),
                                );
                              })
                        }),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              ElevatedButton(onPressed: () async {
               
                await remove();
                print("before user details");
                  await UserDetails();
                setState(() async {
                  
                 print("inside state");
                });
                print("out of state");
              }, child: Text('Remove Picture')),
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
              const SizedBox(
                height: 150,
              ),
              SizedBox(
                  width: 200,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () async {
                       
                        if(image!=null){ await save(_name.text);
                         image=null;
                         }
                        UserDetails();
                        setState(() async {
                         
                        });
                        print("save button");
                        
                        
                      },
                      
                      child: const Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}
