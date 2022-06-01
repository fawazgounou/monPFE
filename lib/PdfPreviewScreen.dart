import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfPreviewScreen extends StatelessWidget {
  final String path;

   PdfPreviewScreen({required this.path});

  @override
  Widget build(BuildContext context) {
    return PdfPreviewScreen(
      path: path,
    );
  }
}
