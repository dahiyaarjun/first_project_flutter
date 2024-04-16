import 'package:first_project_flutter/backend/laravel.dart';
import 'package:first_project_flutter/models/chapter_model';
import 'package:first_project_flutter/pages/pdfScreen.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

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
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
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
                  decoration: BoxDecoration(
                      color: Colors.orange[200],
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      )),
                  child: ListTile(
                    title: Text(post.chapter),
                    subtitle: Text(post.chapterName!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_red_eye),
                          onPressed: () {
                           
                            Navigator.push(context,MaterialPageRoute(
                              builder: (context)=>pdfScreen(pdfurl: post.url)));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.download),
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
