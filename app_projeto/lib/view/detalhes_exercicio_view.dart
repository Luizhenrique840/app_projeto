import 'package:flutter/material.dart';

class DetalhesExercicioView extends StatelessWidget {
  const DetalhesExercicioView({super.key});

  // Informações de cada exercício
  static const Map<String, Map<String, String>> detalhesExercicios = {
    'Supino reto': {
      'musculos': 'Peitoral, tríceps e deltoide anterior',
      'execucao':
          'Deite no banco, segure a barra com as mãos afastadas na largura adequada e abaixe-a controladamente até próximo ao peito. Depois, empurre a barra para cima.',
      'dica':
          'Mantenha os pés apoiados no chão e evite realizar movimentos bruscos.',
    },
    'Supino inclinado': {
      'musculos': 'Parte superior do peitoral, tríceps e ombros',
      'execucao':
          'Deite no banco inclinado, segure os halteres ou a barra e desça o peso de forma controlada. Em seguida, empurre-o para cima.',
      'dica':
          'Use uma inclinação confortável e controle a descida do peso.',
    },
    'Crucifixo': {
      'musculos': 'Peitoral e deltoide anterior',
      'execucao':
          'Deitado no banco, abra os braços com os cotovelos levemente flexionados e depois aproxime-os novamente sobre o peito.',
      'dica':
          'Utilize uma carga leve o suficiente para manter o controle do movimento.',
    },
    'Puxada frontal': {
      'musculos': 'Latíssimo do dorso, bíceps e músculos das costas',
      'execucao':
          'Sentado no aparelho, segure a barra e puxe-a em direção à parte superior do peito. Depois, retorne lentamente à posição inicial.',
      'dica':
          'Evite puxar a barra atrás da nuca ou balançar excessivamente o tronco.',
    },
    'Remada curvada': {
      'musculos': 'Costas, bíceps e deltoide posterior',
      'execucao':
          'Incline o tronco mantendo a coluna neutra. Puxe a barra em direção ao abdômen e depois estenda os braços de forma controlada.',
      'dica':
          'Mantenha a coluna neutra e escolha uma carga que permita executar o movimento corretamente.',
    },
    'Rosca direta': {
      'musculos': 'Bíceps braquial e músculos do antebraço',
      'execucao':
          'Em pé, segure a barra com as palmas das mãos voltadas para cima. Flexione os cotovelos para elevar a barra e depois abaixe-a lentamente.',
      'dica':
          'Evite balançar o corpo para ajudar a levantar o peso.',
    },
    'Tríceps pulley': {
      'musculos': 'Tríceps braquial',
      'execucao':
          'Em frente ao aparelho, segure a barra ou corda e estenda os cotovelos para empurrar o acessório para baixo. Retorne controladamente.',
      'dica':
          'Mantenha os cotovelos próximos ao corpo.',
    },
    'Agachamento livre': {
      'musculos': 'Quadríceps, glúteos e músculos estabilizadores',
      'execucao':
          'Afaste os pés aproximadamente na largura dos ombros, flexione os quadris e joelhos para descer e depois retorne à posição inicial.',
      'dica':
          'Mantenha os pés firmes e execute uma amplitude confortável, sem perder o controle.',
    },
    'Leg press': {
      'musculos': 'Quadríceps, glúteos e posteriores da coxa',
      'execucao':
          'Posicione os pés na plataforma, destrave o aparelho, flexione os joelhos controladamente e empurre a plataforma para retornar.',
      'dica':
          'Não trave os joelhos bruscamente ao estender as pernas.',
    },
    'Cadeira extensora': {
      'musculos': 'Quadríceps',
      'execucao':
          'Sentado no aparelho, estenda os joelhos para elevar o apoio das pernas e depois retorne lentamente.',
      'dica':
          'Ajuste o aparelho ao seu corpo e evite movimentos rápidos.',
    },
    'Elevação lateral': {
      'musculos': 'Deltoide lateral',
      'execucao':
          'Segure os halteres ao lado do corpo e eleve os braços lateralmente até uma altura confortável. Depois, abaixe-os lentamente.',
      'dica':
          'Use uma carga controlável e evite balançar o tronco.',
    },
    'Desenvolvimento': {
      'musculos': 'Deltoides e tríceps',
      'execucao':
          'Com halteres ou barra, posicione os pesos próximos aos ombros e empurre-os para cima. Depois, retorne controladamente.',
      'dica':
          'Evite arquear excessivamente a região lombar.',
    },
    'Mesa flexora': {
      'musculos': 'Posteriores da coxa',
      'execucao':
          'Deitado no aparelho, flexione os joelhos para aproximar o apoio dos glúteos e retorne lentamente.',
      'dica':
          'Mantenha o quadril apoiado e controle a volta do movimento.',
    },
    'Panturrilha em pé': {
      'musculos': 'Gastrocnêmio e sóleo',
      'execucao':
          'Com os pés apoiados, eleve os calcanhares e fique na ponta dos pés. Depois, desça lentamente.',
      'dica':
          'Evite usar impulso e faça o movimento com controle.',
    },
    'Levantamento terra': {
      'musculos': 'Glúteos, posteriores da coxa, costas e músculos estabilizadores',
      'execucao':
          'Com os pés posicionados adequadamente e a coluna neutra, segure a barra e estenda quadris e joelhos para levantá-la. Retorne controladamente.',
      'dica':
          'Aprenda a técnica com orientação profissional antes de aumentar a carga.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final exercicio =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final nome = exercicio['nome'] ?? 'Exercício';
    final grupo = exercicio['grupo'] ?? 'Não informado';
    final series = exercicio['series'] ?? 'Não informado';
    final descricao = exercicio['descricao'] ?? '';

    final detalhes = detalhesExercicios[nome] ??
        {
          'musculos': grupo,
          'execucao': descricao.isNotEmpty
              ? descricao
              : 'Consulte um profissional para aprender a execução correta.',
          'dica':
              'Utilize uma carga adequada e peça orientação a um profissional.',
        };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do exercício'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.fitness_center,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Text(
                nome,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Center(
              child: Text(
                grupo,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 24),

            _secao(
              titulo: 'Séries e repetições',
              texto: series,
              icone: Icons.repeat,
            ),

            _secao(
              titulo: 'Músculos trabalhados',
              texto: detalhes['musculos']!,
              icone: Icons.accessibility_new,
            ),

            _secao(
              titulo: 'Como executar',
              texto: detalhes['execucao']!,
              icone: Icons.menu_book,
            ),

            _secao(
              titulo: 'Dicas importantes',
              texto: detalhes['dica']!,
              icone: Icons.lightbulb_outline,
            ),
          ],
        ),
      ),
    );
  }

  Widget _secao({
    required String titulo,
    required String texto,
    required IconData icone,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icone, color: Colors.blue, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    texto,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
