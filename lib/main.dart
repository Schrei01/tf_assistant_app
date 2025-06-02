import 'package:flutter/material.dart';
import 'package:tf_assistant_app/botones_control.dart';
import 'package:tf_assistant_app/cronometro_controller.dart';
import 'package:tf_assistant_app/cronometro_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CronometroController _controllerGame = CronometroController(segundosIniciales: 60);
  final CronometroController _controllerTurn = CronometroController(segundosIniciales: 5);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TF Assistant'), centerTitle: true),
        body: Column(
          children: [
            Expanded(
              child: Center(child: CronometroWidget(controller: _controllerGame)),
            ),
            Expanded(
              child: Center(child: CronometroWidget(controller: _controllerTurn)),
            ), // Puedes usar este para otra cosa
            Expanded(
              child: Center(child: BotonesControl(controllerGame: _controllerGame, controllerTurn: _controllerTurn)),
            ),
          ],
        ),
      ),
    );
  }
}
