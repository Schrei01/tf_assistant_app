import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class PdfViewerScreen extends StatefulWidget {
  final String title;
  final String assetPath;

  const PdfViewerScreen({
    super.key,
    required this.title,
    required this.assetPath,
  });

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  final PdfViewerController _controller = PdfViewerController();
  late final PdfTextSearcher _textSearcher =
      PdfTextSearcher(_controller)..addListener(_onSearchUpdate);

  final TextEditingController _searchController = TextEditingController();

  void _onSearchUpdate() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _textSearcher.removeListener(_onSearchUpdate);
    _textSearcher.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _startSearch(String query) {
    _textSearcher.resetTextSearch(); // Limpiar búsquedas anteriores
    _textSearcher.startTextSearch(
      query,
      caseInsensitive: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Buscar en el PDF',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onSubmitted: _startSearch,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () {
                    _textSearcher.goToPrevMatch();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () {
                    _textSearcher.goToNextMatch();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: PdfViewer.asset(
        widget.assetPath,
        controller: _controller,
        params: PdfViewerParams(
          pagePaintCallbacks: [
            _textSearcher.pageTextMatchPaintCallback,
          ],
        ),
      ),
    );
  }
}