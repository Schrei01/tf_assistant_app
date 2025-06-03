import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PdfViewerScreen extends StatefulWidget {
  final String assetPath;

  const PdfViewerScreen({super.key, required this.assetPath});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    preparePdf();
  }

  Future<void> preparePdf() async {
    final bytes = await rootBundle.load(widget.assetPath);
    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/temp.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List(), flush: true);
    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habilidades de equipo")),
      body: localPath != null
          ? PDFView(filePath: localPath!)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

