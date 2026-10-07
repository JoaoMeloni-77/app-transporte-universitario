import 'package:flutter/material.dart';
import '../controller/lista_motorista_controller.dart';

class ListaMotoristaView extends StatefulWidget {
  const ListaMotoristaView({super.key});

  @override
  State<ListaMotoristaView> createState() => _ListaMotoristaViewState();
}

class _ListaMotoristaViewState extends State<ListaMotoristaView> {
  final _controller = ListaMotoristaController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Passageiros'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.indigo.withValues(alpha: 0.1), // Correção aplicada aqui
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Confirmados:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${_controller.totalConfirmados} alunos',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _controller.passageiros.length,
                itemBuilder: (context, index) {
                  final aluno = _controller.passageiros[index];
                  final bool vai = aluno['status'] == 'Confirmado';

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: vai ? Colors.green : Colors.red,
                      child: Icon(
                        vai ? Icons.check : Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      aluno['nome'],
                      style: TextStyle(
                        decoration: vai
                            ? TextDecoration.none
                            : TextDecoration.lineThrough,
                      ),
                    ),
                    subtitle: Text('Ponto: ${aluno['ponto']}'),
                    trailing: Text(
                      aluno['status'],
                      style: TextStyle(
                        color: vai ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
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