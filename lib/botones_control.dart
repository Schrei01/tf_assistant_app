import 'package:flutter/material.dart';
import 'package:tf_assistant_app/controllers/cronometro_controller.dart';

class BotonesControl extends StatelessWidget {
  final CronometroController controllerGame;
  final CronometroController controllerTurn;


  const BotonesControl({
    super.key, 
    required this.controllerGame, 
    required this.controllerTurn
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed:  () {
          controllerGame.start();
          controllerTurn.start();
          }, child: const Text('Start')),
            const SizedBox(width: 10),
        ElevatedButton(onPressed:  () {
          controllerGame.pause();
          controllerTurn.pause();
          }, child: const Text('Pause')),
            const SizedBox(width: 10),
        ElevatedButton(onPressed:  () {
          controllerGame.reset();
          controllerTurn.reset();
          }, child: const Text('Reset')),
            const SizedBox(width: 10),
        ElevatedButton(onPressed:  () {
          controllerGame.pause();
          controllerTurn.reset();
          }, child: const Text('Next')),
      ],
    );
  }
}
