

import 'package:app_projeto/favoritos_view.dart';
import 'package:app_projeto/view/cadastro_usuario_view.dart';
import 'package:app_projeto/view/detalhes_exercicio_view.dart';
import 'package:app_projeto/view/exercicios_View.dart';
import 'package:app_projeto/view/login_view.dart';
import 'package:app_projeto/view/perfil_view.dart';
import 'package:app_projeto/view/recuperar_senha_view.dart';
import 'package:app_projeto/view/sobre_view.dart';
import 'package:app_projeto/view/tela_inicial_view.dart';
import 'package:app_projeto/view/treinos_view.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MainApp()
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',

      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginView(),
        'cadastro_usuario': (context) => const CadastroUsuarioView(),
        'perfil': (context) => const PerfilView(),
        'recuperar_senha': (context) => const RecuperarSenhaView(),
        'sobre': (context) => const SobreView(),
        'telainicial': (context) => const TelaInicialView(),
        'treinos': (context) => const TreinosView(),
        'exercicios': (context) => const ExerciciosView(),
        'favoritos': (context) => const FavoritosView(),
        'detalhes_exercicio': (context) => const DetalhesExercicioView(),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      },

    );
  }
}