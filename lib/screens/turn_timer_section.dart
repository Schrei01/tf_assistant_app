import 'package:flutter/material.dart';
import 'package:tf_assistant_app/cronometro_controller.dart';
import 'package:tf_assistant_app/cronometro_widget.dart';
import 'package:tf_assistant_app/player_controller.dart';

class TurnTimerSection extends StatelessWidget {
  
  final CronometroController _controllerTurn;
  final PlayerController playerController;
  final ValueNotifier<int> puntajeNotifier = ValueNotifier<int>(0);
  final ValueNotifier<Map<int, int>> puntajesNotifier =
    ValueNotifier({1: 0, 2: 0, 3: 0, 4: 0});
  
  TurnTimerSection({
    super.key,
    required CronometroController controllerTurn, 
    required this.playerController,
  }) : _controllerTurn = controllerTurn;

  void actualizarPuntaje(int jugador, int delta) {
    final mapa = Map<int, int>.from(puntajesNotifier.value);
    mapa[jugador] = (mapa[jugador] ?? 0) + delta;
    puntajesNotifier.value = mapa;
  }
  
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
            return Column(
              children: [
                Text('Turno Jugador $currentPlayer',
                    style: const TextStyle(fontSize: 16)),
                ValueListenableBuilder<Map<int, int>>(
                  valueListenable: puntajesNotifier,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var inc in [1, 10, 100]) ...[
              ElevatedButton(
                onPressed: () {
                  final jugador = playerController.currentPlayerNotifier.value;
                  actualizarPuntaje(jugador, inc);
                },
                child: Text('+$inc'),
              ),
              const SizedBox(width: 10),
            ],
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var dec in [1, 10, 100]) ...[
              ElevatedButton(
                onPressed: () {
                  final jugador = playerController.currentPlayerNotifier.value;
                  actualizarPuntaje(jugador, -dec);
                },
                child: Text('-$dec'),
              ),
              const SizedBox(width: 10),
            ],
          ],
        ),
      ],
    ),
      ),
    );
  }
}