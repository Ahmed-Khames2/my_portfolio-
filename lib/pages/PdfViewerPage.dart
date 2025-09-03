import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
// import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatelessWidget {
  final String assetPath;
  const PdfViewerPage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My CV")),
      body: PdfView(
        controller: PdfController(
          document: PdfDocument.openAsset(assetPath),
        ),
      ),
    );
  }
}
