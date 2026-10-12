import 'package:flutter/material.dart';

class ExerciciosView extends StatefulWidget {
  const ExerciciosView({super.key});

  @override
  State<ExerciciosView> createState() => _ExerciciosViewState();
}

class _ExerciciosViewState extends State<ExerciciosView> {
  String grupoSelecionado = 'Peito';

  final List<Map<String, String>> exercicios = [
    {
      'nome': 'Supino reto',
      'grupo': 'Peito',
      'series': '4 séries × 10 repetições',
      'descricao': 'Exercício para trabalhar os músculos do peito.',
    },
    {
      'nome': 'Supino inclinado',
      'grupo': 'Peito',
      'series': '3 séries × 10 repetições',
      'descricao': 'Exercício com ênfase na parte superior do peito.',
    },
    {
      'nome': 'Crucifixo',
      'grupo': 'Peito',
      'series': '3 séries × 12 repetições',
      'descricao': 'Exercício de abertura para os músculos do peito.',
    },
    {
      'nome': 'Crossover',
      'grupo': 'Peito',
      'series': '3 séries × 12 repetições',
      'descricao': 'Exercício realizado na polia para trabalhar o peito.',
    },
    {
      'nome': 'Puxada alta',
      'grupo': 'Costas',
      'series': '4 séries × 10 repetições',
      'descricao': 'Exercício de puxada para trabalhar as costas.',
    },
    {
      'nome': 'Remada baixa',
      'grupo': 'Costas',
      'series': '3 séries × 12 repetições',
      'descricao': 'Exercício para trabalhar os músculos das costas.',
    },
    {
      'nome': 'Remada curvada',
      'grupo': 'Costas',
      'series': '3 séries × 10 repetições',
      'descricao': 'Exercício de remada para os músculos das costas.',
    },
    {
      'nome': 'Rosca direta',
      'grupo': 'Braços',
      'series': '3 séries × 12 repetições',
      'descricao': 'Exercício para fortalecer os bíceps.',
    },
    {
      'nome': 'Rosca martelo',
      'grupo': 'Braços',
      'series': '3 séries × 12 repetições',
      'descricao': 'Variação da rosca para trabalhar os braços.',
    },
    {
      'nome': 'Tríceps pulley',
      'grupo': 'Braços',
      'series': '3 séries × 12 repetições',
      'descricao': 'Exercício na polia para trabalhar os tríceps.',
    },
    {
      'nome': 'Agachamento',
      'grupo': 'Pernas',
      'series': '4 séries × 10 repetições',
      'descricao': 'Exercício composto para trabalhar as pernas.',
    },
    {
      'nome': 'Leg press',
      'grupo': 'Pernas',
      'series': '3 séries × 12 repetições',
      'descricao': 'Exercício realizado na máquina leg press.',
    },
    {
      'nome': 'Cadeira extensora',
      'grupo': 'Pernas',
      'series': '3 séries × 12 repetições',
      'descricao': 'Exercício com foco nos quadríceps.',
    },
    {
      'nome': 'Elevação lateral',
      'grupo': 'Ombros',
      'series': '3 séries × 12 repetições',
      'descricao': 'Exercício para trabalhar a parte lateral dos ombros.',
    },
    {
      'nome': 'Desenvolvimento',
      'grupo': 'Ombros',
      'series': '3 séries × 10 repetições',
      'descricao': 'Exercício para trabalhar os ombros.',
    },
  ];

  final List<String> grupos = [
    'Peito',
    'Costas',
    'Braços',
    'Pernas',
    'Ombros',
  ];

  @override
  Widget build(BuildContext context) {
    final exerciciosFiltrados = exercicios
        .where(
          (exercicio) => exercicio['grupo'] == grupoSelecionado,
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercícios'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Encontre seu exercício',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Selecione um grupo muscular:',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 4,

              children: grupos.map((grupo) {
                final selecionado = grupoSelecionado == grupo;

                return ChoiceChip(
                  label: Text(grupo),
                  selected: selecionado,
                  selectedColor: Colors.blue,

                  labelStyle: TextStyle(
                    color: selecionado
                        ? Colors.white
                        : Colors.black,
                  ),

                  onSelected: (valor) {
                    setState(() {
                      grupoSelecionado = grupo;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            Text(
              'Exercícios de $grupoSelecionado',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: exerciciosFiltrados.length,

                itemBuilder: (context, index) {
                  final exercicio = exerciciosFiltrados[index];

                  return Card(
                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),

                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),

                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.fitness_center,
                          color: Colors.white,
                        ),
                      ),

                      title: Text(
                        exercicio['nome']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        exercicio['series']!,
                      ),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),

                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'detalhes_exercicio',
                          arguments: exercicio,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,

        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, 'telainicial');
          } else if (index == 1) {
            Navigator.pushNamed(context, 'treinos');
          } else if (index == 3) {
            Navigator.pushNamed(context, 'favoritos');
          } else if (index == 4) {
            Navigator.pushNamed(context, 'perfil');
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Treinos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Exercícios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}