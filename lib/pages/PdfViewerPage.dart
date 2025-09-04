import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatefulWidget {
  final String assetPath;
  const PdfViewerPage({super.key, required this.assetPath});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  PdfController? _pdfController;
  PdfControllerPinch? _pdfControllerPinch;

  int _currentPage = 1;
  int _totalPages = 0;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      _pdfController = PdfController(
        document: PdfDocument.openAsset(widget.assetPath),
        initialPage: 1,
      );
    } else {
      _pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openAsset(widget.assetPath),
        initialPage: 1,
      );
    }
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    _pdfControllerPinch?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // appBar: AppBar(title: const Text("My CV"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child:
                kIsWeb
                    ? PdfView(
                      controller: _pdfController!,
                      scrollDirection: Axis.vertical,
                      onDocumentLoaded: (doc) {
                        setState(() {
                          _totalPages = doc.pagesCount;
                        });
                      },
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                    )
                    : PdfViewPinch(
                      controller: _pdfControllerPinch!,
                      onDocumentLoaded: (doc) {
                        setState(() {
                          _totalPages = doc.pagesCount;
                        });
                      },
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                    ),
          ),

          // 📌 Page indicator + controls
          Container(
            color: theme.colorScheme.surfaceVariant,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed:
                      _currentPage > 1
                          ? () {
                            if (kIsWeb) {
                              _pdfController?.previousPage(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 300),
                              );
                            } else {
                              _pdfControllerPinch?.previousPage(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 300),
                              );
                            }
                          }
                          : null,
                ),
                Text(
                  "Page $_currentPage of $_totalPages",
                  style: theme.textTheme.bodyMedium,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed:
                      _currentPage < _totalPages
                          ? () {
                            if (kIsWeb) {
                              _pdfController?.nextPage(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 300),
                              );
                            } else {
                              _pdfControllerPinch?.nextPage(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 300),
                              );
                            }
                          }
                          : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
