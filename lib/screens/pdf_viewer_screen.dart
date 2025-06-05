import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdfrx/pdfrx.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

class PdfViewerScreen extends StatefulWidget {
  final String assetPath;
  final String title;

  const PdfViewerScreen({
    super.key, 
    required this.assetPath, 
    required this.title
    });

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: PdfViewer.asset(widget.assetPath)
    );
  }
}

