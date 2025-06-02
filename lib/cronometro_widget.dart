import 'package:flutter/material.dart';
import 'package:tf_assistant_app/cronometro_controller.dart';

class CronometroWidget extends StatelessWidget {
  final CronometroController controller;

  const CronometroWidget({super.key, required this.controller});

  // String _formatTime(int seconds) {
  //   final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
  //   final secs = (seconds % 60).toString().padLeft(2, '0');
  //   return '$minutes:$secs';
  // }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: controller.tiempo,
      builder: (context, tiempo, _) {
        return Text(
          '$tiempo',
          style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}
