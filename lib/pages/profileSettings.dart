// ignore: file_names
import 'dart:io';

import 'package:first_project_flutter/custom_helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _MyWidgetState();
}
 File? _image;

ImageCropper _cropper=ImageCropper();
class _MyWidgetState extends State<Settings> {
  static String baseUrl = AppConstants.baseUrl;

  Future<void> _uploadImage(String email) async {
    
    if (_image == null) {
      print("Na hui image selected");
      return;
    }

    final url = Uri.parse('${baseUrl}api/user/upload-img');
    final request = http.MultipartRequest('POST', url);

    // Attach the image file to the request
    request.files.add(
      await http.MultipartFile.fromPath('image', _image!.path),
    );

    // You can add headers if needed
    // request.headers['Authorization'] = 'Bearer YOUR_API_TOKEN';

    final response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      print("Image uploaded successfully");
      print("Response: ${response.body}");
    } else {
      print("Failed to upload image. Status code: ${response.statusCode}");
      print("Error message: ${response.body}");
    }
  }

//  Future<File?> _cropImage(String path) async {
//     File? croppedFile = await _cropper.cropImage(
//       sourcePath: path,
//       aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
//       compressQuality: 100,
//       maxWidth: 700,
//       maxHeight: 700,
//       androidUiSettings: AndroidUiSettings(
//         toolbarTitle: 'Crop Image',
//         toolbarColor: Colors.deepOrange,
//         toolbarWidgetColor: Colors.white,
//         activeControlsWidgetColor: Colors.white,
//         initAspectRatio: CropAspectRatioPreset.square,
//         lockAspectRatio: true,
//       ),
//     );

//     return croppedFile;
//   }


  // final ImagePicker _picker = ImagePicker();
 

   Future<void> _pickImage(ImageSource source) async {
    // ImagePicker picker = ImagePicker();
    // final pickedFile = await picker.pickImage(source: source);
    
    
      
        final ImagePicker picker = ImagePicker();
        final XFile? img = await picker.pickImage(
          source: source, // alternatively, use ImageSource.gallery
          // maxWidth: 400,
        );
        if (img != null) {
        setState(() {
          _image = File(img.path); // convert it to a Dart:io file
        });
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
      
// getImage(){

// }
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
                                  _uploadImage("dahiyaarjun343@gmail.com");
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
                                onTap: () {
                                  _pickImage(ImageSource.camera);
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