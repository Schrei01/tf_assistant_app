import 'dart:async';

import 'package:flutter/material.dart';

class CronometroController extends ChangeNotifier {
  final int segundosIniciales;
  late int _segundosRestantes;
  Timer? _timer;

  final ValueNotifier<int> tiempo = ValueNotifier<int>(0);
  final ValueNotifier<bool> estaCorriendo = ValueNotifier<bool>(false);

  CronometroController({required this.segundosIniciales}) {
    _segundosRestantes = segundosIniciales;
    tiempo.value = _segundosRestantes;
  }

  void start() {
    if (_timer != null && _timer!.isActive) return;
    estaCorriendo.value = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_segundosRestantes > 0) {
        _segundosRestantes--;
        tiempo.value = _segundosRestantes;
      } else {
        pause();
      }
    });
  }

  void pause() {
    _timer?.cancel();
    estaCorriendo.value = false;
  }

  void reset() {
    pause();
    _segundosRestantes = segundosIniciales;
    tiempo.value = _segundosRestantes;
  }

  @override
  void dispose() {
    _timer?.cancel();
    tiempo.dispose();
    estaCorriendo.dispose();
    super.dispose();
  }
}
