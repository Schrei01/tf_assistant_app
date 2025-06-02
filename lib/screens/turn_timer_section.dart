import 'package:flutter/material.dart';
import 'package:tf_assistant_app/controllers/cronometro_controller.dart';
import 'package:tf_assistant_app/widgets/cronometro_widget.dart';
import 'package:tf_assistant_app/controllers/player_controller.dart';

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
            Text("Tiempo del turno"),
            CronometroWidget(controller: _controllerTurn),
            const SizedBox(height: 10),

            // Jugador actual y puntaje
            ValueListenableBuilder<int>(
              valueListenable: playerController.currentPlayerNotifier,
              builder: (context, currentPlayer, _) {
                return Column(
                  children: [
                    Text('Turno del Jugador $currentPlayer',
                        style: const TextStyle(fontSize: 16)),
                    ValueListenableBuilder<Map<int, int>>(
                      valueListenable: playerController.puntajesNotifier,
                      builder: (context, puntajes, _) {
                        final puntaje = puntajes[currentPlayer] ?? 0;
                        return Text('Puntaje: $puntaje',
                            style: const TextStyle(fontSize: 16));
                      },
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // Botones para sumar
            ButtonsRow(
              playerController: playerController, 
              operation: "+",
              ),

            const SizedBox(height: 20),

            // Botones para restar
            ButtonsRow(
              playerController: playerController, 
              operation: "-",
              ),
          ],
        ),
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  final String operation;
  final PlayerController playerController;

  const ButtonsRow({
    super.key,
    required this.playerController,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    final isAddition = operation == '+';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var value in [5, 10, 100]) ...[
          ElevatedButton(
            onPressed: () {
              final jugador = playerController.currentPlayerNotifier.value;
              final delta = isAddition ? value : -value;
              playerController.actualizarPuntaje(jugador, delta);
            },
            child: Text('$operation$value'),
          ),
          const SizedBox(width: 10),
        ],
      ],
    );
  }
}
