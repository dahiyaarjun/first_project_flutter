import 'package:first_project_flutter/app/modules/home/view.dart';
import 'package:first_project_flutter/login.dart';
import 'package:first_project_flutter/model_user_login.dart';
import 'package:first_project_flutter/practice.dart';
import 'package:first_project_flutter/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Todo List using GetX',
      home: HomePage(),
    );
  }
}
