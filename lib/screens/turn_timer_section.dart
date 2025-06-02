import 'package:flutter/material.dart';
import 'package:tf_assistant_app/cronometro_controller.dart';
import 'package:tf_assistant_app/cronometro_widget.dart';
import 'package:tf_assistant_app/player_controller.dart';

class TurnTimerSection extends StatelessWidget {
  
  final CronometroController _controllerTurn;
  final PlayerController playerController;
  
  const TurnTimerSection({
    super.key,
    required CronometroController controllerTurn, 
    required this.playerController,
  }) : _controllerTurn = controllerTurn;

  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CronometroWidget(controller: _controllerTurn),
            const SizedBox(height: 10),
            ValueListenableBuilder<int>(
              valueListenable: playerController.currentPlayerNotifier,
              builder: (context, currentPlayer, _) {
                return Text(
                  'Turno Jugador $currentPlayer',
                  style: const TextStyle(fontSize: 16),
                );
              },
            ),
            const Text(
              'Puntaje: 100',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed:  () {
                  }, child: const Text('+1')),
                    const SizedBox(width: 10),
                ElevatedButton(onPressed:  () {
                  }, child: const Text('+10')),
                    const SizedBox(width: 10),
                ElevatedButton(onPressed:  () {
                  }, child: const Text('+100')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed:  () {
                  }, child: const Text('-1')),
                    const SizedBox(width: 10),
                ElevatedButton(onPressed:  () {
                  }, child: const Text('-10')),
                    const SizedBox(width: 10),
                ElevatedButton(onPressed:  () {
                  }, child: const Text('-100')),
              ],
            )
          ],
        ),
      ),
    );
  }
}