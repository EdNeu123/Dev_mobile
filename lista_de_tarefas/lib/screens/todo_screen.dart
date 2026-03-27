import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // Lista que armazena as tarefas
  List<Tarefa> tarefas = [];

  // Controller para o TextField
  final _controller = TextEditingController();

  // Adiciona uma nova tarefa à lista
  void _adicionarTarefa() {
    final texto = _controller.text.trim();

    // Não adiciona se o campo estiver vazio
    if (texto.isEmpty) {
      return;
    }

    setState(() {
      tarefas.add(Tarefa(titulo: texto));
    });

    // Limpa o campo após adicionar
    _controller.clear();
  }

  // Alterna o estado de concluída da tarefa
  void _alternarConcluida(int index) {
    setState(() {
      tarefas[index].concluida = !tarefas[index].concluida;
    });
  }

  // Remove uma tarefa da lista
  void _removerTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  // BÔNUS: Remove todas as tarefas concluídas
  void _limparConcluidas() {
    setState(() {
      tarefas.removeWhere((tarefa) => tarefa.concluida);
    });
  }

  // BÔNUS: Conta quantas tarefas estão concluídas
  int get _totalConcluidas {
    int count = 0;
    for (var tarefa in tarefas) {
      if (tarefa.concluida) {
        count++;
      }
    }
    return count;
  }

  // Libera o controller (ciclo de vida - Aula 7)
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          // BÔNUS: Botão para limpar concluídas (só aparece se tem alguma)
          if (_totalConcluidas > 0)
            IconButton(
              onPressed: _limparConcluidas,
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Limpar concluídas',
            ),
        ],
      ),
      body: Column(
        children: [
          // Campo de texto + botão para adicionar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // TextField ocupa o espaço disponível
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Nova tarefa',
                      border: OutlineInputBorder(),
                    ),
                    // Permite adicionar apertando Enter no teclado
                    onSubmitted: (_) => _adicionarTarefa(),
                  ),
                ),

                const SizedBox(width: 12),

                // Botão para adicionar
                FloatingActionButton(
                  onPressed: _adicionarTarefa,
                  backgroundColor: Colors.deepPurple,
                  mini: true,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ),

          // BÔNUS: Contador de tarefas
          if (tarefas.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${tarefas.length} tarefa(s)',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '$_totalConcluidas concluída(s)',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 8),

          // Lista de tarefas ou mensagem de lista vazia
          Expanded(
            child: tarefas.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhuma tarefa cadastrada.\nAdicione sua primeira tarefa!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: tarefas.length,
                    itemBuilder: (context, index) {
                      final tarefa = tarefas[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        // BÔNUS: Cor diferente para concluída
                        color: tarefa.concluida
                            ? Colors.green[50]
                            : Colors.white,
                        child: ListTile(
                          // Checkbox para marcar/desmarcar
                          leading: Checkbox(
                            value: tarefa.concluida,
                            activeColor: Colors.green,
                            onChanged: (_) => _alternarConcluida(index),
                          ),
                          // Título com risco quando concluída
                          title: Text(
                            tarefa.titulo,
                            style: TextStyle(
                              fontSize: 16,
                              // Texto riscado quando concluída
                              decoration: tarefa.concluida
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              // BÔNUS: Cor mais clara quando concluída
                              color: tarefa.concluida
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                          // Botão de deletar (lixeira)
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => _removerTarefa(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
