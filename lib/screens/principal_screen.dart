

import 'package:flutter/material.dart';
import 'package:tf_assistant_app/controllers/player_controller.dart';
import 'package:tf_assistant_app/controllers/cronometro_controller.dart';
import 'package:tf_assistant_app/widgets/botones_control.dart';
import 'package:tf_assistant_app/shared/game_timer_section.dart';
import 'package:tf_assistant_app/shared/turn_timer_section.dart';

class PrincipalScreen extends StatelessWidget {

  final int minutosPartida;
  final int segundosPartida;
  final int minutosTurno;
  final int segundosTurno;
  final int numeroJugadores;

  const PrincipalScreen({
    super.key, 
    required this.segundosPartida, 
    required this.segundosTurno, 
    required this.numeroJugadores, 
    required this.minutosPartida, 
    required this.minutosTurno
    });

  @override
  Widget build(BuildContext context) {
    
    final CronometroController controllerGame = CronometroController(minutosIniciales: minutosPartida, segundosIniciales: segundosPartida);
    final CronometroController controllerTurn = CronometroController(minutosIniciales: minutosTurno, segundosIniciales: segundosTurno);
    final playerController = PlayerController(numeroJugadores);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TF Assistant')
        ),
      
      body: Column(
        children: [
          GameTimerSection(
            controllerGame: controllerGame
            ),
          TurnTimerSection(
            controllerTurn: controllerTurn,
            playerController: playerController
            ), // Puedes usar este para otra cosa
          ButtonsSection(
            controllerGame: controllerGame, 
            controllerTurn: controllerTurn,
            playerController: playerController,
            ),// Tu contenido aquí...
        ],
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
