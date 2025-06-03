import 'package:flutter/material.dart';
import 'package:tf_assistant_app/controllers/cronometro_controller.dart';
import 'package:tf_assistant_app/controllers/player_controller.dart';
import 'package:tf_assistant_app/widgets/cronometro_widget.dart';

class GameTimerSection extends StatelessWidget {
  
  final CronometroController _controllerGame;
  final PlayerController playerController;
  
  const GameTimerSection({
    super.key,
    required CronometroController controllerGame, required this.playerController,
  }) : _controllerGame = controllerGame;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("⏱ Tiempo de la partida"),
            CronometroWidget(controller: _controllerGame),
            ValueListenableBuilder<int>(
              valueListenable: playerController.ronda,
              builder: (context, ronda, _) {
                return Text("🔁 Ronda: $ronda", style: const TextStyle(fontSize: 18));
              },
            ),

          ]
        )
      ),
    );
  }
}