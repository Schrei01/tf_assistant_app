import 'package:flutter/material.dart';
import 'package:tf_assistant_app/player_controller.dart';
import 'package:tf_assistant_app/screens/botones_control.dart';
import 'package:tf_assistant_app/cronometro_controller.dart';
import 'package:tf_assistant_app/screens/game_timer_section.dart';
import 'package:tf_assistant_app/screens/turn_timer_section.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CronometroController _controllerGame = CronometroController(minutosIniciales: 60, segundosIniciales: 0);
  final CronometroController _controllerTurn = CronometroController(minutosIniciales: 5, segundosIniciales: 0);
  final _playerController = PlayerController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TF Assistant'), centerTitle: true),
        body: Column(
          children: [
            GameTimerSection(controllerGame: _controllerGame),
            TurnTimerSection(
              controllerTurn: _controllerTurn,
              playerController: _playerController
              ), // Puedes usar este para otra cosa
            ButtonsSection(
              controllerGame: _controllerGame, 
              controllerTurn: _controllerTurn,
              playerController: _playerController,
              ),
          ],
        ),
      ),
    );
  }
}

class ButtonsSection extends StatelessWidget {
  
  final CronometroController _controllerGame;
  final CronometroController _controllerTurn;
  final PlayerController _playerController;
  
   const ButtonsSection({
    super.key,
    required CronometroController controllerGame,
    required CronometroController controllerTurn, 
    required PlayerController playerController,
  }) : _controllerGame = controllerGame, _controllerTurn = controllerTurn, _playerController = playerController;

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: BotonesControl(
          controllerGame: _controllerGame, 
          controllerTurn: _controllerTurn,
          playerController: _playerController,
          )),
    );
  }
}