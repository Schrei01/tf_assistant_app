import 'package:flutter/material.dart';
import '../controllers/cronometro_controller.dart'; // Asegúrate de importar tu controlador

class CronometroWidget extends StatelessWidget {
  final CronometroController controller;

  const CronometroWidget({super.key, required this.controller});

  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: controller.tiempo,
      builder: (context, tiempoRestante, _) {
        return Text(
          _formatTime(tiempoRestante),
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
