import 'dart:convert';
import 'dart:html';
import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/models/subjectmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package';
import 'package:flutter/material.dart';

class subject extends StatefulWidget {
  const subject({super.key});

  @override
  State<subject> createState() => _streamState();
}

class _streamState extends State<subject> {
//   List<subject> postList=[];
//  Future<List<subject>> getPost ()async{
// final Response=await http.get(Uri.parse('https://violent-wall-production.up.railway.app/api/user/get-subjects'));
// var data=jsonDecode(Response.body.toString());
// if(Response.statusCode==200){
//   for(Map i in data){
//    postList.add(subject.fromJson(i));
//   }
//   return postList;
// }else{
//   return postList;
// }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('12 subjects',style:TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 30.0,
              color: Colors.white )),
              centerTitle: true,
        backgroundColor: Colors.blueGrey,),
  
        body:FutureBuilder<List<subjectmodel>>(
        future: apiResponse.getSubject(),
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
                    title: Text(post.subjectName!),
                    // subtitle: Text(post.!),
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