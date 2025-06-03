import 'package:flutter/material.dart';
import 'package:tf_assistant_app/screens/principal_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _formKey = GlobalKey<FormState>();

  final _partidaMinController = TextEditingController(text: '60');
  final _partidaSegController = TextEditingController(text: '0');

  final _turnoMinController = TextEditingController(text: '5');
  final _turnoSegController = TextEditingController(text: '0');

  final _jugadoresController = TextEditingController(text: '2');

  @override
  void dispose() {
    _partidaMinController.dispose();
    _partidaSegController.dispose();
    _turnoMinController.dispose();
    _turnoSegController.dispose();
    _jugadoresController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('⚙️ Configurar partida')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('⏱ Tiempo de la partida'),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _partidaMinController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Minutos'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _partidaSegController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Segundos'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('🔁 Tiempo por turno'),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _turnoMinController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Minutos'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _turnoSegController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Segundos'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _jugadoresController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: '👥 Número de jugadores'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    final partidaMin = int.tryParse(_partidaMinController.text) ?? 0;
                    final partidaSeg = int.tryParse(_partidaSegController.text) ?? 0;
                    final turnoMin = int.tryParse(_turnoMinController.text) ?? 0;
                    final turnoSeg = int.tryParse(_turnoSegController.text) ?? 0;
                    final jugadores = int.tryParse(_jugadoresController.text) ?? 2;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PrincipalScreen(
                          minutosPartida: partidaMin,
                          segundosPartida: partidaSeg,
                          minutosTurno: turnoMin,
                          segundosTurno: turnoSeg,
                          numeroJugadores: jugadores,
                        ),
                      ),
                    );
                  },
                  child: const Text('Comenzar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

