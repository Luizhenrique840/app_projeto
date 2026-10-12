class TreinosController {
  static List<Map<String, String>> obterExercicios(
    String nomeTreino,
  ) {
    final Map<String, List<Map<String, String>>> exerciciosPorTreino = {
      'Peito e Tríceps': [
        {'nome': 'Supino reto', 'series': '4 séries × 10 repetições'},
        {'nome': 'Supino inclinado', 'series': '3 séries × 10 repetições'},
        {'nome': 'Crucifixo', 'series': '3 séries × 12 repetições'},
        {'nome': 'Tríceps pulley', 'series': '3 séries × 12 repetições'},
        {'nome': 'Tríceps francês', 'series': '3 séries × 10 repetições'},
      ],
      'Costas e Bíceps': [
        {'nome': 'Puxada alta', 'series': '4 séries × 10 repetições'},
        {'nome': 'Remada baixa', 'series': '3 séries × 12 repetições'},
        {'nome': 'Remada curvada', 'series': '3 séries × 10 repetições'},
        {'nome': 'Rosca direta', 'series': '3 séries × 12 repetições'},
        {'nome': 'Rosca martelo', 'series': '3 séries × 12 repetições'},
      ],
      'Pernas e Ombros': [
        {'nome': 'Agachamento', 'series': '4 séries × 10 repetições'},
        {'nome': 'Leg press', 'series': '3 séries × 12 repetições'},
        {'nome': 'Cadeira extensora', 'series': '3 séries × 12 repetições'},
        {'nome': 'Elevação lateral', 'series': '3 séries × 12 repetições'},
        {'nome': 'Desenvolvimento', 'series': '3 séries × 10 repetições'},
      ],
      'Peito e Ombros': [
        {'nome': 'Supino reto', 'series': '4 séries × 10 repetições'},
        {'nome': 'Supino inclinado', 'series': '3 séries × 10 repetições'},
        {'nome': 'Elevação lateral', 'series': '3 séries × 12 repetições'},
        {'nome': 'Desenvolvimento', 'series': '3 séries × 10 repetições'},
      ],
      'Costas e Tríceps': [
        {'nome': 'Puxada alta', 'series': '4 séries × 10 repetições'},
        {'nome': 'Remada baixa', 'series': '3 séries × 12 repetições'},
        {'nome': 'Tríceps pulley', 'series': '3 séries × 12 repetições'},
        {'nome': 'Tríceps francês', 'series': '3 séries × 10 repetições'},
      ],
    };

    return exerciciosPorTreino[nomeTreino] ?? [];
  }
}