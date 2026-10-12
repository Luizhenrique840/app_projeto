import 'package:flutter/material.dart';
import 'package:app_projeto/controller/treino_selecionado_controller.dart';
import 'package:app_projeto/controller/treinos_controller.dart';

class TelaInicialView extends StatelessWidget {
  const TelaInicialView({super.key});

  @override
  Widget build(BuildContext context) {
final treinoSelecionado =
    TreinoSelecionadoController.treinoSelecionado;

final nomeTreino =
    treinoSelecionado?['nome'] as String? ?? 'Peito e Tríceps';

final List<Map<String, String>> exercicios =
    treinoSelecionado == null
        ? [
            {
              'nome': 'Supino reto',
              'series': '4 séries × 10 repetições',
            },
            {
              'nome': 'Supino inclinado',
              'series': '3 séries × 10 repetições',
            },
            {
              'nome': 'Tríceps pulley',
              'series': '3 séries × 12 repetições',
            },
            {
              'nome': 'Tríceps francês',
              'series': '3 séries × 12 repetições',
            },
          ]
        : TreinosController.obterExercicios(nomeTreino);
    return Scaffold(
      appBar: AppBar(
        title: const Text('GymTrack'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'perfil');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Olá!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Confira seu treino de hoje.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 25),

            const Text(
              'Treino de hoje',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              nomeTreino,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: exercicios.length,

                itemBuilder: (context, index) {
                  final exercicio = exercicios[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),

                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.fitness_center),
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

      // BARRA INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        // CORREÇÃO:
        type: BottomNavigationBarType.fixed,

        currentIndex: 0,

        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, 'treinos');
          }

          if (index == 2) {
            Navigator.pushNamed(context, 'exercicios');
          }

          if (index == 3) {
            Navigator.pushNamed(context, 'favoritos');
          }

          if (index == 4) {
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