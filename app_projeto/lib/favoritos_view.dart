import 'package:flutter/material.dart';
import 'package:app_projeto/controller/favoritos_controller.dart';
import 'package:app_projeto/view/detalhes_treino_view.dart';

class FavoritosView extends StatefulWidget {
  const FavoritosView({super.key});

  @override
  State<FavoritosView> createState() => _FavoritosViewState();
}

class _FavoritosViewState extends State<FavoritosView> {
  @override
  Widget build(BuildContext context) {
    final favoritos = TreinosDados.favoritos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Meus treinos favoritos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Acesse os treinos que você salvou.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: favoritos.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 70,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Nenhum treino favoritado.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Acesse Treinos e toque no coração.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: favoritos.length,

                      itemBuilder: (context, index) {
                        final treino = favoritos[index];

                        return Card(
                          margin: const EdgeInsets.only(
                            bottom: 12,
                          ),

                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.all(12),

                            leading: const CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.fitness_center,
                                color: Colors.white,
                              ),
                            ),

                            title: Text(
                              treino['nome'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            subtitle: Text(
                              treino['descricao'] as String,
                            ),

                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),

                                  onPressed: () {
                                    setState(() {
                                      TreinosDados.favoritos
                                          .removeAt(index);
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
                                  builder: (context) =>
                                      DetalhesTreinoView(
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
        currentIndex: 3,

        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, 'telainicial');
          } else if (index == 1) {
            Navigator.pushNamed(context, 'treinos');
          } else if (index == 2) {
            Navigator.pushNamed(context, 'exercicios');
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