
import 'package:flutter/material.dart';
import 'package:app_projeto/controller/treinos_controller.dart';
import 'package:app_projeto/controller/treino_selecionado_controller.dart';

class DetalhesTreinoView extends StatelessWidget {
  final Map<String, dynamic> treino;

  const DetalhesTreinoView({
    super.key,
    required this.treino,
  });

  @override
  Widget build(BuildContext context) {
    final exercicios = TreinosController.obterExercicios(
      treino['nome'] as String,
    );

    final corTreino = treino['cor'] as Color;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Treino'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: corTreino,
                      child: Icon(
                        treino['icone'] as IconData,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Text(
                            treino['nome'] as String,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            treino['descricao'] as String,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    TreinoSelecionadoController.treinoSelecionado = treino;

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      'telainicial',
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.check_circle),
                  label: const Text('Selecionar este treino'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),


            const SizedBox(height: 20),

            const Text(
              'Exercícios do treino',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              '${exercicios.length} exercícios cadastrados',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: exercicios.length,

                itemBuilder: (context, index) {
                  final exercicio = exercicios[index];

                  return Card(
                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),

                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            corTreino.withValues(alpha: 0.15),

                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: corTreino,
                            fontWeight: FontWeight.bold,
                          ),
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
                        Icons.fitness_center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
