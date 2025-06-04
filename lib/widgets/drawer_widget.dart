import 'package:flutter/material.dart';
import 'package:tf_assistant_app/screens/pdf_viewer_screen.dart';
import '../data/pdf_items.dart';

class DrawerWidget extends StatelessWidget {
  
  const DrawerWidget({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 125, 58, 212)),
            child: Text('📚 Biblioteca de guías', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ...pdfItems.map((item) {
            return ListTile(
              leading: Text(item.emoji, style: const TextStyle(fontSize: 20)),
              title: Text(item.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PdfViewerScreen(
                      title: item.title,
                      assetPath: item.path,
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}