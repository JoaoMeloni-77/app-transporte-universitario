import 'package:flutter/material.dart';

class HomeAlunoView extends StatefulWidget {
  const HomeAlunoView({super.key});

  @override
  State<HomeAlunoView> createState() => _HomeAlunoViewState();
}

class _HomeAlunoViewState extends State<HomeAlunoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Transporte'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, 'perfil'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Status de Hoje',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('• Ida: Confirmado (18:10)'),
                      Text('• Volta: Confirmado (22:30)'),
                      Text('• Ponto: Praça Central'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.edit_calendar),
                label: const Text('Alterar Confirmação do Dia'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
                onPressed: () {
                  Navigator.pushNamed(context, 'confirmar_presenca');
                },
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                icon: const Icon(Icons.format_list_bulleted),
                label: const Text('Ver Lista do Motorista'),
                onPressed: () {
                  Navigator.pushNamed(context, 'lista_motorista');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}