import 'package:flutter/material.dart';

class PlayerController extends ChangeNotifier {
  int _currentPlayer = 1;
  final int totalPlayers;

  final ValueNotifier<int> currentPlayerNotifier = ValueNotifier<int>(1);

  PlayerController({
    this.totalPlayers = 4
    });

  void nextPlayer() {
    _currentPlayer = _currentPlayer % totalPlayers + 1;
    currentPlayerNotifier.value = _currentPlayer;
    notifyListeners();
  }
  int get currentPlayer => _currentPlayer;

  @override
  void dispose() {
    currentPlayerNotifier.dispose();
    super.dispose();
  }
}
