import 'package:flutter/material.dart';
import '../models/habito.dart';

class HabitDetailsScreen extends StatelessWidget {
  // Recebe o hábito da tela anterior via construtor (Aula 8)
  final Habito habito;

  const HabitDetailsScreen({super.key, required this.habito});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(habito.nome),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ícone grande representando o hábito
            Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: habito.concluido ? Colors.green[100] : Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  habito.concluido ? Icons.check_circle : Icons.pending,
                  size: 80,
                  color: habito.concluido ? Colors.green : Colors.deepPurple,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Nome do hábito
            Text(
              habito.nome,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Status
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: habito.concluido ? Colors.green : Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                habito.concluido ? 'Concluído' : 'Pendente',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Descrição
            const Text(
              'Descrição',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              habito.descricao.isEmpty ? 'Sem descrição' : habito.descricao,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
