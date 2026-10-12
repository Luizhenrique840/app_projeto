
import 'package:flutter/material.dart';
import 'package:app_projeto/controller/favoritos_controller.dart';
import 'detalhes_treino_view.dart';

class TreinosView extends StatefulWidget {
  const TreinosView({super.key});

  @override
  State<TreinosView> createState() => _TreinosViewState();
}

class _TreinosViewState extends State<TreinosView> {
  @override
  Widget build(BuildContext context) {
    final treinos = TreinosDados.treinos;
    final favoritos = TreinosDados.favoritos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Treinos'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escolha seu treino',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Selecione o grupo muscular que deseja treinar.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: treinos.length,
                itemBuilder: (context, index) {
                  final treino = treinos[index];

                  final isFavorito = favoritos.any(
                    (item) => item['nome'] == treino['nome'],
                  );

                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15),

                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: treino['cor'],
                        child: Icon(
                          treino['icone'],
                          color: Colors.white,
                          size: 28,
                        ),
                      ),

                      title: Text(
                        treino['nome'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(treino['descricao']),
                      ),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            tooltip: isFavorito
                                ? 'Remover dos favoritos'
                                : 'Adicionar aos favoritos',
                            icon: Icon(
                              isFavorito
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorito
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                if (isFavorito) {
                                  favoritos.removeWhere(
                                    (item) =>
                                        item['nome'] == treino['nome'],
                                  );
                                } else {
                                  favoritos.add(treino);
                                }
                              });
                            },
                          ),

                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      ),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetalhesTreinoView(
                              treino: treino,
                            ),
                          ),
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
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, 'telainicial');
          } else if (index == 2) {
            Navigator.pushNamed(context, 'exercicios');
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
