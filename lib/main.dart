import 'package:app_projeto/view/cadastro_usuario_view.dart';
import 'package:app_projeto/view/confirmar_presenca_view.dart';
import 'package:app_projeto/view/home_aluno_view.dart';
import 'package:app_projeto/view/lista_motorista_view.dart';
import 'package:app_projeto/view/login_view.dart';
import 'package:app_projeto/view/perfil_view.dart';
import 'package:app_projeto/view/recuperar_senha_view.dart';
import 'package:app_projeto/view/sobre_view.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transporte Universitário',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginView(),
        'cadastrar_usuario': (context) => const CadastroUsuarioView(),
        'perfil': (context) => const PerfilView(),
        'recuperar_senha': (context) => const RecuperarSenhaView(),
        'sobre': (context) => const SobreView(),

        // NOVAS ROTAS DO APP
        'home_aluno': (context) => const HomeAlunoView(),
        'confirmar_presenca': (context) => const ConfirmarPresencaView(),
        'lista_motorista': (context) => const ListaMotoristaView(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      },
    );
  }
}