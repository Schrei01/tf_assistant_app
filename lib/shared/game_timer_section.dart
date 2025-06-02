import 'package:flutter/material.dart';
import 'package:tf_assistant_app/controllers/cronometro_controller.dart';
import 'package:tf_assistant_app/widgets/cronometro_widget.dart';

class GameTimerSection extends StatelessWidget {
  const GameTimerSection({
    super.key,
    required CronometroController controllerGame,
  }) : _controllerGame = controllerGame;

  final CronometroController _controllerGame;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("⏱ Tiempo de la partida"),
            CronometroWidget(controller: _controllerGame),
          ]
        )
      ),
    );
  }
}