import 'package:flutter/material.dart';

void main() {
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Responsivo',
      home: const DashboardPage(),
    );
  }
}

// ============================================================
// WIDGET REUTILIZÁVEL - DashboardCard
// ============================================================

/// Card de métrica reutilizável.
/// Aceita: título, valor, ícone e cor.
class DashboardCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icone;
  final Color cor;

  const DashboardCard({
    super.key,
    required this.titulo,
    required this.valor,
    required this.icone,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: Colors.white, size: 32),
          const SizedBox(height: 12),
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PÁGINA PRINCIPAL
// ============================================================

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém a largura da tela com MediaQuery (Aula 6)
    var width = MediaQuery.of(context).size.width;

    // 4 cards do dashboard
    final cards = [
      const DashboardCard(
        titulo: 'Total em Estoque',
        valor: '251 peças',
        icone: Icons.inventory_2_outlined,
        cor: Colors.teal,
      ),
      const DashboardCard(
        titulo: 'Modelos',
        valor: '4 modelos',
        icone: Icons.category_outlined,
        cor: Colors.indigo,
      ),
      const DashboardCard(
        titulo: 'Estoque Baixo',
        valor: '3 itens',
        icone: Icons.warning_amber_rounded,
        cor: Colors.orange,
      ),
      const DashboardCard(
        titulo: 'Valor Total',
        valor: 'R\$ 12.580,00',
        icone: Icons.attach_money,
        cor: Colors.green,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard - Estoque'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _buildLayout(width, cards),
      ),
    );
  }

  /// Escolhe o layout baseado na largura da tela
  Widget _buildLayout(double width, List<Widget> cards) {
    // MOBILE: < 600px → Column (1 card por linha)
    if (width < 600) {
      return Column(
        children: [
          cards[0],
          const SizedBox(height: 12),
          cards[1],
          const SizedBox(height: 12),
          cards[2],
          const SizedBox(height: 12),
          cards[3],
        ],
      );
    }
    // TABLET: 600-900px → Wrap (2 cards por linha)
    else if (width < 900) {
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          SizedBox(width: (width - 44) / 2, child: cards[0]),
          SizedBox(width: (width - 44) / 2, child: cards[1]),
          SizedBox(width: (width - 44) / 2, child: cards[2]),
          SizedBox(width: (width - 44) / 2, child: cards[3]),
        ],
      );
    }
    // DESKTOP: > 900px → Row (4 cards com Expanded)
    else {
      return Row(
        children: [
          Expanded(child: cards[0]),
          const SizedBox(width: 12),
          Expanded(child: cards[1]),
          const SizedBox(width: 12),
          Expanded(child: cards[2]),
          const SizedBox(width: 12),
          Expanded(child: cards[3]),
        ],
      );
    }
  }
}
