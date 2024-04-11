import 'dart:convert';
// import 'dart:html';
import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/models/chapter_model';
import 'package:first_project_flutter/models/subjectmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package';
import 'package:flutter/material.dart';

class chapter extends StatefulWidget {
  String _class;
  String _branch;
  String _subject;
  chapter(this._class,this._branch,this._subject);

  @override
  State<chapter> createState() => _streamState();
}

class _streamState extends State<chapter> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Class ${widget._class} ${widget._subject} Chapters',style:TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 30.0,
              color: Colors.white )),
              centerTitle: true,
        backgroundColor: Colors.blueGrey,),
  
        body:FutureBuilder<List<chapterModel>>(
        future: apiResponse.getChapters(widget._class,widget._branch,widget._subject),
        builder: (BuildContext context, AsyncSnapshot<List<chapterModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Container(
                            decoration: BoxDecoration(   
           color: Colors.blueAccent, 
           border: Border.all( 
             color: Colors.white, 
             width: 4.0, 
           )),
                  child: ListTile(
                    title: Text(post.chapter),
                    subtitle: Text(post.chapterName!),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}