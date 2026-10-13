import 'package:flutter/material.dart';

class SobreView extends StatelessWidget {
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o aplicativo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Ícone do aplicativo
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.fitness_center,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Nome do aplicativo
            const Text(
              'GymTrack',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 30),

            // Objetivo do aplicativo
            _criarCartao(
              icone: Icons.flag,
              titulo: 'Objetivo do aplicativo',
              descricao:
                  'O GymTrack tem como objetivo auxiliar os usuários '
                  'na organização e no acompanhamento de seus treinos '
                  'de academia. O aplicativo permite consultar exercícios, '
                  'visualizar diferentes opções de treino e organizar '
                  'os exercícios favoritos, contribuindo para uma rotina '
                  'de atividades físicas mais organizada.',
            ),

            // Integrantes da equipe
            _criarCartao(
              icone: Icons.people,
              titulo: 'Equipe de desenvolvimento',
              descricao:
                  'Luiz Henrique Conti Malvestio',
            ),

            // Instituição
            _criarCartao(
              icone: Icons.school,
              titulo: 'Instituição',
              descricao: 'Fatec Ribeirão Preto',
            ),

            // Disciplina
            _criarCartao(
              icone: Icons.menu_book,
              titulo: 'Disciplina',
              descricao: 'Programação para Dispositivos Móveis',
            ),

            // Professor
            _criarCartao(
              icone: Icons.person_outline,
              titulo: 'Professor',
              descricao: 'Rodrigo de Oliveira Plotze',
            ),

            // Versão do aplicativo
            _criarCartao(
              icone: Icons.info_outline,
              titulo: 'Versão do aplicativo',
              descricao: '1.0',
            ),

            const SizedBox(height: 20),

            // Rodapé
          ],
        ),
      ),
    );
  }

  // Método para criar os cartões informativos
  Widget _criarCartao({
    required IconData icone,
    required String titulo,
    required String descricao,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(
            icone,
            color: Colors.blue,
          ),
        ),

        title: Text(
          titulo,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            descricao,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
