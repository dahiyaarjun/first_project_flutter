import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class pdfScreen extends StatelessWidget {
 

   final String pdfurl;

   pdfScreen({required this.pdfurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pdf viewer'),
        centerTitle: true,
      ),

      body: SfPdfViewer.network(pdfurl,
     canShowPaginationDialog: true,
     pageSpacing: 2.0,
      ),
    );
  }
}