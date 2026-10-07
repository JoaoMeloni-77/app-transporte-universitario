import 'package:flutter/material.dart';
import '../controller/gerenciar_pontos_controller.dart';

class GerenciarPontosView extends StatefulWidget {
  const GerenciarPontosView({super.key});

  @override
  State<GerenciarPontosView> createState() => _GerenciarPontosViewState();
}

class _GerenciarPontosViewState extends State<GerenciarPontosView> {
  final _controller = GerenciarPontosController();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _mostrarDialogoNovoPonto() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Novo Ponto'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Nome do ponto',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _textController.clear();
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.adicionarPonto(_textController.text);
                _textController.clear();
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Pontos'),
      ),
      body: SafeArea(
        child: _controller.pontos.isEmpty
            ? const Center(child: Text('Nenhum ponto cadastrado.'))
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _controller.pontos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.location_on, color: Colors.indigo),
                      title: Text(_controller.pontos[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _controller.removerPonto(index),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoNovoPonto,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}