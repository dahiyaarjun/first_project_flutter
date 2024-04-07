import 'dart:io';

import 'package:first_project_flutter/backend/laravel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class Settings extends StatefulWidget {
  String email;
  Settings({super.key, required this.email});

  @override
  State<Settings> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Settings> {
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
          color: Colors.blue,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                child: InkWell(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          image != null ? FileImage(image! as File) : null,
                      child:
                          image == null ? const Icon(Icons.person, size: 70) : null,
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
                                                  final image = await picker.pickImage(source: ImageSource.gallery);
                                                  if (image != null) {
                                                    setState(() {showSpinner = true;});
                                                    Uint8List bytes =await image.readAsBytes();
                                                    await apiResponse().uploadImage(bytes,widget.email,image.name).then((value) {
                                                      setState(() {
                                                      });
                                                      print(value.toString());
                                                    }).onError((error,stackTrace) {
                                                      print(error.toString());
                                                    });
                                                    setState(() {showSpinner = false;});
                                                  }
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
                                                  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
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
              Container(
                padding: const EdgeInsets.all(40),
                child: TextFormField(
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
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}
