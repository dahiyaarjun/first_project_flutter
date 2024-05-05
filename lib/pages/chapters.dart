import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/custom_helper/colors.dart';
import 'package:first_project_flutter/models/chapter_model';
import 'package:first_project_flutter/pages/pdfScreen.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:lottie/lottie.dart';

class chapter extends StatefulWidget {
  final String _class;
  final String _branch;
  final String _subject;
  chapter(this._class, this._branch, this._subject);

  @override
  State<chapter> createState() => _streamState();
}

class _streamState extends State<chapter> {
  
  final _flutterDownloader = MediaDownload();
  // final String pdfUrl;
  // const PdfViewer({required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class ${widget._class} ${widget._subject} Chapters',
            style: const TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 19.0,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.DarkPurple,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<chapterModel>>(
        future: apiResponse.getChapters(
            widget._class, widget._branch, widget._subject),
        builder:
            (BuildContext context, AsyncSnapshot<List<chapterModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Container(
 margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.01,
          // bottom: MediaQuery.of(context).size.height * 0.01,
          left: MediaQuery.of(context).size.width * 0.01,
          right: MediaQuery.of(context).size.width * 0.01),
                        decoration: BoxDecoration(   
           color: AppColors.DarkPurple, 
           border: Border.all( 
             color: AppColors.DarkPurple, 
             width: 2.0, 
           ), 
           borderRadius: BorderRadius.circular(10.0), 
           gradient: LinearGradient( 
             colors: [ 
              Colors.white, 
              Colors.white 
             ] 
           ), 
          boxShadow: [ 
            BoxShadow( 
              color: Colors.grey , 
              blurRadius: 2.0, 
              offset: Offset(4.0,4.0) 
            ) 
          ],
          ) ,
                  child: ListTile(
                    title: Text(post.chapter),
                    subtitle: Text(post.chapterName!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          color: AppColors.Blue,
                          onPressed: () {
                           
                            Navigator.push(context,MaterialPageRoute(
                              builder: (context)=>pdfScreen(pdfurl: post.url)));
                          },
                        ),
                  //       new GestureDetector(
                  //       onTap: (){
                  //         _flutterDownloader.downloadMedia(context, post.url);
                  //       },
                  //       child:Container(
                  //                       child: Lottie.asset('assets/videos/download.json',
                  // // height: MediaQuery.of(context).size.height * 0.4,
                  // // width: MediaQuery.of(context).size.width,
                  // // reverse: true,
                  // repeat: true,
                  // fit: BoxFit.cover),
                  //       ),),
                        IconButton(
                          icon: const Icon(Icons.download),
                          color: AppColors.Green,
                          focusColor: Colors.white,
                          onPressed: () async {
                            _flutterDownloader.downloadMedia(context, post.url);
                          },
                        ),
                      ],
                    ),
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
