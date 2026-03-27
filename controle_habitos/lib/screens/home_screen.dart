import 'package:flutter/material.dart';
import '../models/habito.dart';
import 'habit_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista que armazena os hábitos
  List<Habito> habitos = [];

  // Controla se os dados ainda estão carregando
  bool carregando = true;

  // Controller para o campo de adicionar hábito (Aula 7)
  final _controller = TextEditingController();

  // initState — chamado 1x na inicialização (Aula 7)
  @override
  void initState() {
    super.initState();
    _carregarHabitos();
  }

  // Simula carregamento inicial com async/await e Future.delayed (Aula 3)
  Future<void> _carregarHabitos() async {
    // Simula tempo de carregamento (ex: buscando de uma API)
    await Future.delayed(const Duration(seconds: 2));

    // Depois do "carregamento", preenche a lista
    setState(() {
      habitos = [
        Habito(
          nome: 'Beber água',
          descricao: 'Beber pelo menos 2 litros de água por dia.',
        ),
        Habito(
          nome: 'Estudar',
          descricao: 'Estudar pelo menos 1 hora de Flutter/Dart.',
        ),
        Habito(
          nome: 'Exercitar-se',
          descricao: 'Fazer 30 minutos de atividade física.',
        ),
        Habito(
          nome: 'Ler',
          descricao: 'Ler pelo menos 20 páginas de um livro.',
        ),
        Habito(
          nome: 'Meditar',
          descricao: 'Meditar por 10 minutos.',
        ),
      ];
      carregando = false;
    });
  }

  // Alterna o estado de concluído do hábito (Aula 7 - setState)
  void _alternarConcluido(int index) {
    setState(() {
      habitos[index].concluido = !habitos[index].concluido;
    });
  }

  // Remove um hábito da lista
  void _removerHabito(int index) {
    setState(() {
      habitos.removeAt(index);
    });
  }

  // Adiciona um novo hábito digitado pelo usuário
  void _adicionarHabito() {
    final texto = _controller.text.trim();

    if (texto.isEmpty) {
      return;
    }

    setState(() {
      habitos.add(Habito(nome: texto));
    });

    _controller.clear();
  }

  // Limpa todos os hábitos concluídos
  void _limparConcluidos() {
    setState(() {
      habitos.removeWhere((habito) => habito.concluido);
    });
  }

  // Conta quantos hábitos estão concluídos
  int get _totalConcluidos {
    int count = 0;
    for (var habito in habitos) {
      if (habito.concluido) {
        count++;
      }
    }
    return count;
  }

  // Navega para a tela de detalhes passando o hábito (Aula 8)
  void _irParaDetalhes(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HabitDetailsScreen(habito: habitos[index]),
      ),
    );
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
        title: const Text('Meus Hábitos'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          // Botão para limpar concluídos (só aparece se tem algum)
          if (_totalConcluidos > 0)
            IconButton(
              onPressed: _limparConcluidos,
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Limpar concluídos',
            ),
        ],
      ),
      // Se está carregando, mostra mensagem. Senão, mostra o conteúdo.
      body: carregando
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hourglass_top, size: 48, color: Colors.deepPurple),
                  SizedBox(height: 16),
                  Text(
                    'Carregando hábitos...',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                // Campo para adicionar novo hábito
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            labelText: 'Novo hábito',
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (_) => _adicionarHabito(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      FloatingActionButton(
                        onPressed: _adicionarHabito,
                        backgroundColor: Colors.deepPurple,
                        mini: true,
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // Contador de hábitos
                if (habitos.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${habitos.length} hábito(s)',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '$_totalConcluidos concluído(s)',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 8),

                // Lista de hábitos ou mensagem de vazio
                Expanded(
                  child: habitos.isEmpty
                      ? const Center(
                          child: Text(
                            'Nenhum hábito cadastrado.\nAdicione seu primeiro hábito!',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          itemCount: habitos.length,
                          itemBuilder: (context, index) {
                            final habito = habitos[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              // Cor diferente para hábito concluído
                              color: habito.concluido
                                  ? Colors.green[50]
                                  : Colors.white,
                              child: ListTile(
                                // Checkbox para marcar como concluído
                                leading: Checkbox(
                                  value: habito.concluido,
                                  activeColor: Colors.green,
                                  onChanged: (_) => _alternarConcluido(index),
                                ),
                                // Nome com risco se concluído
                                title: Text(
                                  habito.nome,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: habito.concluido
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    color: habito.concluido
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  habito.concluido
                                      ? 'Concluído!'
                                      : 'Pendente',
                                  style: TextStyle(
                                    color: habito.concluido
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                ),
                                // Botão de deletar
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _removerHabito(index),
                                ),
                                // Ao tocar, navega para detalhes (Aula 8)
                                onTap: () => _irParaDetalhes(index),
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
