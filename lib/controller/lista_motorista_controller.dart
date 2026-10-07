import 'package:flutter/material.dart';

class ListaMotoristaController extends ChangeNotifier {
  // Dados simulados para visualização da lista
  final List<Map<String, dynamic>> passageiros = [
    {'nome': 'João Coutinho', 'ponto': 'Praça Central', 'status': 'Confirmado'},
    {'nome': 'Marcela Cristina', 'ponto': 'Praça Central', 'status': 'Confirmado'},
    {'nome': 'Marcos Fioroto', 'ponto': 'Trevo', 'status': 'Cancelado'},
  ];

  int get totalConfirmados => 
      passageiros.where((p) => p['status'] == 'Confirmado').length;
}