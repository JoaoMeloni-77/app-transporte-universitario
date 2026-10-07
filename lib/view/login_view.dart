import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza os itens na tela
            children: [
              const Icon(Icons.directions_bus, size: 80, color: Colors.indigo), // Mudei pro ícone de ônibus/transporte!
              const SizedBox(height: 30),

              const TextField(
                decoration: InputDecoration(
                  labelText: 'E-mail', // Corrigido de E-mal
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),

              Align(
                alignment: Alignment.centerRight, // Corrigido para Alignment.centerRight
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      'recuperar_senha',
                    );
                  },
                  child: const Text('Esqueceu a senha?'),
                ),
              ),
              const SizedBox(height: 20),
              
              // Botão de Entrar configurado
              SizedBox(
                width: double.infinity, // Faz o botão ocupar toda a largura
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Substitui a tela atual pela Home do Aluno
                    Navigator.pushReplacementNamed(context, 'home_aluno');
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Botão de Cadastro configurado
              TextButton(
                onPressed: () {
                  // Vai para a tela de cadastro
                  Navigator.pushNamed(context, 'cadastrar_usuario');
                },
                child: const Text(
                  'Ainda não tem conta? Cadastre-se.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}