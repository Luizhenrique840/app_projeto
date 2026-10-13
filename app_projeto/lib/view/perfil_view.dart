import 'package:flutter/material.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  String nome = 'Meu Nome';
  String email = 'meuemail@email.com';
  String idade = '20 anos';
  String peso = '70 kg';
  String altura = '1,72 m';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            // Foto do usuário
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 65,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            // Nome
            Text(
              nome,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            // E-mail
            Text(
              email,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 24),

            // Informações pessoais
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informações pessoais',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),

            const SizedBox(height: 12),

            _criarCartao(
              icone: Icons.cake,
              titulo: 'Idade',
              valor: idade,
            ),

            _criarCartao(
              icone: Icons.monitor_weight,
              titulo: 'Peso',
              valor: peso,
            ),

            _criarCartao(
              icone: Icons.height,
              titulo: 'Altura',
              valor: altura,
            ),

            const SizedBox(height: 20),

            // Botão de editar perfil
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _editarPerfil,
                icon: const Icon(Icons.edit),
                label: const Text('Editar perfil'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Novo botão: Sobre o aplicativo
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, 'sobre');
                },
                icon: const Icon(Icons.info_outline),
                label: const Text('Sobre'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Botão: Sair da conta
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'login',
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Sair da conta'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(
                    color: Colors.red,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Menu inferior
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 4,

        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, 'telainicial');
          } else if (index == 1) {
            Navigator.pushNamed(context, 'treinos');
          } else if (index == 2) {
            Navigator.pushNamed(context, 'exercicios');
          } else if (index == 3) {
            Navigator.pushNamed(context, 'favoritos');
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

  // Cartão de informação
  Widget _criarCartao({
    required IconData icone,
    required String titulo,
    required String valor,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),

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
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(valor),
      ),
    );
  }

  // Abre a edição dos dados
  void _editarPerfil() {
    final nomeController = TextEditingController(text: nome);
    final emailController = TextEditingController(text: email);
    final idadeController = TextEditingController(text: idade);
    final pesoController = TextEditingController(text: peso);
    final alturaController = TextEditingController(text: altura);

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Editar perfil'),

          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                TextField(
                  controller: idadeController,
                  decoration: const InputDecoration(
                    labelText: 'Idade',
                    prefixIcon: Icon(Icons.cake),
                  ),
                ),

                TextField(
                  controller: pesoController,
                  decoration: const InputDecoration(
                    labelText: 'Peso',
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                ),

                TextField(
                  controller: alturaController,
                  decoration: const InputDecoration(
                    labelText: 'Altura',
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
              ],
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancelar'),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  nome = nomeController.text;
                  email = emailController.text;
                  idade = idadeController.text;
                  peso = pesoController.text;
                  altura = alturaController.text;
                });

                Navigator.pop(dialogContext);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}