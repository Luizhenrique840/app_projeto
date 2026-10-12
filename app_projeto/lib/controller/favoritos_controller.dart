import 'package:flutter/material.dart';

class TreinosDados {
  static final List<Map<String, dynamic>> treinos = [
    {
      'nome': 'Peito e Tríceps',
      'descricao': 'Treino para peito e tríceps',
      'icone': Icons.fitness_center,
      'cor': Colors.red,
    },
    {
      'nome': 'Costas e Bíceps',
      'descricao': 'Treino para costas e bíceps',
      'icone': Icons.accessibility_new,
      'cor': Colors.blue,
    },
    {
      'nome': 'Pernas e Ombros',
      'descricao': 'Treino para pernas e ombros',
      'icone': Icons.directions_run,
      'cor': Colors.green,
    },
    {
      'nome': 'Peito e Ombros',
      'descricao': 'Treino para peito e ombros',
      'icone': Icons.sports_gymnastics,
      'cor': Colors.orange,
    },
    {
      'nome': 'Costas e Tríceps',
      'descricao': 'Treino para costas e tríceps',
      'icone': Icons.sports,
      'cor': Colors.purple,
    },
  ];

  static final List<Map<String, dynamic>> favoritos = [];
}