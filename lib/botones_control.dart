import 'package:flutter/material.dart';
import 'package:tf_assistant_app/cronometro_controller.dart';

class BotonesControl extends StatelessWidget {
  final CronometroController controller;

  const BotonesControl({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: controller.start, child: const Text('Iniciar')),
            const SizedBox(width: 10),
        ElevatedButton(onPressed: controller.pause, child: const Text('Detener')),
            const SizedBox(width: 10),
        ElevatedButton(onPressed: controller.reset, child: const Text('Reiniciar')),
      ],
    );
  }
}
