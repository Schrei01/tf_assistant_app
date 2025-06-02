import 'package:flutter/material.dart';
import 'package:tf_assistant_app/controllers/cronometro_controller.dart';
import 'package:tf_assistant_app/controllers/player_controller.dart';
import 'package:tf_assistant_app/screens/start_screen.dart';

class BotonesControl extends StatelessWidget {
  final CronometroController controllerGame;
  final CronometroController controllerTurn;
  final PlayerController playerController;


  const BotonesControl({
    super.key, 
    required this.controllerGame, 
    required this.controllerTurn, 
    required this.playerController
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controllerGame.start();
                controllerTurn.start();
              },
              child: const Text('Start'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                controllerGame.pause();
                controllerTurn.pause();
              },
              child: const Text('Pause'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                controllerGame.pause();
                controllerTurn.reset();
                playerController.nextPlayer();
              },
              child: const Text('Next'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            controllerGame.reset();
            controllerTurn.reset();
            playerController.reiniciarPuntajes();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const StartScreen()),
            );
          },
          child: const Text('Finish'),
        ),
      ],
    );
  }
}
