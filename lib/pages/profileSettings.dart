// ignore: file_names
import 'dart:io';

import 'package:first_project_flutter/custom_helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Settings extends StatefulWidget {
  String email;
  Settings({required this.email});

  @override
  State<Settings> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<Settings> {
 File? _image;
 static String baseUrl = AppConstants.baseUrl;

Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        print('$_image select hogyi');
      } else {
        print('No image selected.');
      }
    });
  }
Future<void> _uploadImage() async {
    if (_image == null) {
      print('No image selected.');
      return;
    }

    // Replace 'YOUR_UPLOAD_URL' with your server endpoint URL
    var uploadUrl = Uri.parse('${baseUrl}api/user/upload-img');
    
    // Create a multipart request
    var request = http.MultipartRequest('POST', uploadUrl);
    
    // Add image file to multipart request
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

    // Optional: add additional data to the request
    // request.fields['description'] = 'Image description';
    
    // Send the request
    request.fields['email'] = widget.email;
    
    // Send the request
    var response = await request.send();
    
    
    // Check if the request was successful
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
      // Optionally, you can handle the response from the server here
    } else {
      print('Image upload failed');
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: BackButton(
          onPressed: () => Navigator.pushNamed(context, 'Search'),
          color: Colors.black,
        ),
      ),
      

      body:
        Container(
          color: Colors.blue,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: InkWell(
                  child: CircleAvatar(
                    radius: 70,
                    
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                   child: _image == null ? Icon(Icons.person, size: 70) : null,
                  
                   
                    
                  ),
                  onTap: () => {
                    showModalBottomSheet(context: context, builder: (builder){
                      return Padding(
                        padding: EdgeInsets.all(18),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                           height: MediaQuery.of(context).size.height/6,
                        
                          child:  Row(
                            children: [
                              Expanded(child: 
                              InkWell(
                                onTap: () async {
                                  print("image pick");
                                  await _pickImage(ImageSource.gallery);
                                  print("beech ka");
                                  // print(widget.email);
                                  _uploadImage();
                                  print("image upload hogyA");
                                },
                                child: SizedBox (
                                  child:Column(children: [
                                    Icon(Icons.image,size: 70),
                                    Text('Gallery')
                                  ],
                                  ),
                                ))),
                              
                              Expanded(child: 
                              InkWell(
                                onTap: () async {
                                  await _pickImage(ImageSource.camera);
                                },
                                child: SizedBox (
                                  child:Column(children: [
                                    Icon(Icons.camera_alt_outlined,size: 70),
                                    Text('Camera')
                                  ],
                                  ),
                                ))),
                              
                            ],
                          ),
                        
                        ),
                      );
                    }
                        
                    )
                
                  }
                ),
              ),
              
              Container(
                padding: EdgeInsets.all(40),
                child: TextFormField(
                  decoration: InputDecoration(
                   
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.030,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.018),
                             hintText: 'Name',
                             border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                  ),
                ),
              ),
              SizedBox(height: 150,),
              SizedBox(width:200,height:30,child: ElevatedButton(onPressed: (){
                setState(() {
                  
                });
              }, child: Text('Save')))
              
            ],
          ),
          
        ),
        
        
      

      

    );
  }
  

}
  
  
