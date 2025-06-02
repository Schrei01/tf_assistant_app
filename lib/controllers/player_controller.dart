import 'package:flutter/material.dart';

class PlayerController extends ChangeNotifier {
  int _currentPlayer = 1;
  final int totalPlayers;

  final ValueNotifier<int> currentPlayerNotifier = ValueNotifier<int>(1);
  late final ValueNotifier<Map<int, int>> puntajesNotifier;


  PlayerController(this.totalPlayers) {
    final Map<int, int> mapaInicial = {
      for (int i = 1; i <= totalPlayers; i++) i: 0
    };
    puntajesNotifier = ValueNotifier<Map<int, int>>(mapaInicial);
  }

  void nextPlayer() {
    _currentPlayer = _currentPlayer % totalPlayers + 1;
    currentPlayerNotifier.value = _currentPlayer;
    notifyListeners();
  }

  int get currentPlayer => _currentPlayer;

  void actualizarPuntaje(int jugador, int delta) {
    final mapa = Map<int, int>.from(puntajesNotifier.value);
    mapa[jugador] = (mapa[jugador] ?? 0) + delta;
    puntajesNotifier.value = mapa;
  }

  void reiniciarPuntajes() {
  final mapa = <int, int>{};
  for (int i = 1; i <= totalPlayers; i++) {
    mapa[i] = 0;
  }
  puntajesNotifier.value = mapa;
  }

  @override
  void dispose() {
    currentPlayerNotifier.dispose();
    puntajesNotifier.dispose();
    super.dispose();
  }
}
