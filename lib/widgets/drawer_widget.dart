import 'package:flutter/material.dart';
import 'package:tf_assistant_app/screens/pdf_viewer_screen.dart';

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
            decoration: BoxDecoration(color: Color.fromARGB(255, 114, 17, 241)),
            child: Text('📚 Biblioteca de guías', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            leading: const Text("📜", style: TextStyle(fontSize: 20)),
            title: const Text('Reglas extensas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PdfViewerScreen(
                    assetPath: 'assets/pdfs/comprehensive_rules.pdf'
                  ),
                ),
              ); // Cierra el drawer
            },
          ),
          ListTile(
            leading: const Text("⚡", style: TextStyle(fontSize: 20)),
            title: const Text('Reglas rápidas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PdfViewerScreen(
                    assetPath: 'assets/pdfs/manual_heroclix.pdf'
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Text("🔥", style: TextStyle(fontSize: 20)),
            title: const Text('Poderes y habilidades'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PdfViewerScreen(
                    assetPath: 'assets/pdfs/poderes_habilidades.pdf'
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Text("🎲", style: TextStyle(fontSize: 20)),
            title: const Text('Formatos alternativos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PdfViewerScreen(
                    assetPath: 'assets/pdfs/modos_alternativos.pdf'
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Text("🛡️", style: TextStyle(fontSize: 20)),
            title: const Text('Habilidades de equipo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PdfViewerScreen(
                    assetPath: 'assets/pdfs/team_abilities.pdf'
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}