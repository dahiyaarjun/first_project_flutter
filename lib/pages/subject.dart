import 'dart:convert';
// import 'dart:html';
import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/models/subjectmodel.dart';
import 'package:first_project_flutter/pages/chapters.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package';
import 'package:flutter/material.dart';

class subject extends StatefulWidget {
  String _class;
  
   subject(this._class);

  @override
  State<subject> createState() => _streamState();
}

class _streamState extends State<subject> {

  String _subject="";
  String _branch="";
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget._class} subjects',style:TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 22.0,
              color: Colors.white )),
              centerTitle: true,
        backgroundColor: Colors.blueGrey,),
  
        body:FutureBuilder<List<subjectmodel>>(
        future: apiResponse.getSubject(widget._class),
        builder: (BuildContext context, AsyncSnapshot<List<subjectmodel>> snapshot) {
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
                    title: Text(post.subjectName),
                    subtitle: (post.branch!=null)?Text(post.branch!):Text(''),
                    onTap: () {
                      _subject=post.subjectName; 
                      (widget._class=="10th")?_branch="":_branch=post.branch!;
                      Navigator.push(context,
              MaterialPageRoute(builder: (context) => chapter(widget._class,_branch,_subject)));
                    }
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