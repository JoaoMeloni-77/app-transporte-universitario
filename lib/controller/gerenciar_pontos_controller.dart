import 'package:flutter/material.dart';

class GerenciarPontosController extends ChangeNotifier {
  List<String> pontos = [
    'Praça Central (Santa Rosa de Viterbo)',
    'Trevo da Cidade',
    'Fatec Ribeirão Preto',
  ];

  void adicionarPonto(String novoPonto) {
    if (novoPonto.isNotEmpty) {
      pontos.add(novoPonto);
      notifyListeners();
    }
  }

  void removerPonto(int index) {
    pontos.removeAt(index);
    notifyListeners();
  }
}