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
      title: 'Dashboard - Estoque de Camisetas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

// ============================================================
// MODELO DE DADOS
// ============================================================

/// Representa uma camiseta no estoque (dados em memória)
class Camiseta {
  final String modelo;
  final String tamanho;
  final String cor;
  final int quantidade;
  final double preco;

  const Camiseta({
    required this.modelo,
    required this.tamanho,
    required this.cor,
    required this.quantidade,
    required this.preco,
  });
}

// Dados fictícios de estoque
const List<Camiseta> estoque = [
  Camiseta(modelo: 'Básica', tamanho: 'P', cor: 'Branca', quantidade: 45, preco: 39.90),
  Camiseta(modelo: 'Básica', tamanho: 'M', cor: 'Branca', quantidade: 62, preco: 39.90),
  Camiseta(modelo: 'Básica', tamanho: 'G', cor: 'Preta', quantidade: 38, preco: 39.90),
  Camiseta(modelo: 'Premium', tamanho: 'M', cor: 'Azul', quantidade: 15, preco: 79.90),
  Camiseta(modelo: 'Premium', tamanho: 'G', cor: 'Verde', quantidade: 8, preco: 79.90),
  Camiseta(modelo: 'Polo', tamanho: 'P', cor: 'Cinza', quantidade: 22, preco: 99.90),
  Camiseta(modelo: 'Polo', tamanho: 'M', cor: 'Branca', quantidade: 3, preco: 99.90),
  Camiseta(modelo: 'Polo', tamanho: 'G', cor: 'Preta', quantidade: 12, preco: 99.90),
  Camiseta(modelo: 'Oversized', tamanho: 'M', cor: 'Bege', quantidade: 27, preco: 59.90),
  Camiseta(modelo: 'Oversized', tamanho: 'G', cor: 'Preta', quantidade: 19, preco: 59.90),
];

// ============================================================
// WIDGET REUTILIZÁVEL - DashboardCard
// ============================================================

/// Card de métrica reutilizável para o dashboard.
/// Aceita: título, valor, ícone e cor.
class DashboardCard extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icone;
  final Color cor;
  final String subtitulo;

  const DashboardCard({
    super.key,
    required this.titulo,
    required this.valor,
    required this.icone,
    required this.cor,
    this.subtitulo = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cor.withAlpha(50)),
        boxShadow: [
          BoxShadow(
            color: cor.withAlpha(30),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Ícone com fundo colorido
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cor.withAlpha(30),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icone, color: cor, size: 28),
          ),
          const SizedBox(width: 16),
          // Informações textuais
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  valor,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                ),
                if (subtitulo.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitulo,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PÁGINA PRINCIPAL - DASHBOARD
// ============================================================

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém a largura da tela usando MediaQuery
    final double larguraTela = MediaQuery.of(context).size.width;

    // Calcula métricas a partir dos dados em memória
    final int totalPecas = estoque.fold(0, (soma, c) => soma + c.quantidade);
    final int modelos = estoque.map((c) => c.modelo).toSet().length;
    final int estoqueBaixo = estoque.where((c) => c.quantidade < 10).length;
    final double valorTotal =
        estoque.fold(0.0, (soma, c) => soma + (c.quantidade * c.preco));

    // Lista de cards do dashboard
    final List<Widget> cards = [
      DashboardCard(
        titulo: 'TOTAL EM ESTOQUE',
        valor: '$totalPecas peças',
        icone: Icons.inventory_2_outlined,
        cor: const Color(0xFF2E7D6F),
        subtitulo: '${estoque.length} registros',
      ),
      DashboardCard(
        titulo: 'MODELOS CADASTRADOS',
        valor: '$modelos modelos',
        icone: Icons.category_outlined,
        cor: const Color(0xFF5C6BC0),
        subtitulo: 'Básica, Premium, Polo, Oversized',
      ),
      DashboardCard(
        titulo: 'ESTOQUE BAIXO',
        valor: '$estoqueBaixo itens',
        icone: Icons.warning_amber_rounded,
        cor: const Color(0xFFE65100),
        subtitulo: 'Quantidade menor que 10',
      ),
      DashboardCard(
        titulo: 'VALOR TOTAL',
        valor: 'R\$ ${valorTotal.toStringAsFixed(2)}',
        icone: Icons.attach_money_rounded,
        cor: const Color(0xFF2E7D32),
        subtitulo: 'Preço × quantidade',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text(
          'Estoque de Camisetas',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFF263238),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Indicador do breakpoint atual
            _buildBreakpointIndicator(larguraTela),
            const SizedBox(height: 16),
            // Layout responsivo baseado na largura
            _buildResponsiveLayout(larguraTela, cards),
            const SizedBox(height: 24),
            // Tabela de estoque usando Stack + Positioned
            _buildTabelaEstoque(),
          ],
        ),
      ),
    );
  }

  /// Exibe um badge indicando o breakpoint ativo (mobile/tablet/desktop)
  Widget _buildBreakpointIndicator(double largura) {
    String dispositivo;
    IconData icone;
    Color cor;

    if (largura < 600) {
      dispositivo = 'Mobile';
      icone = Icons.phone_android;
      cor = const Color(0xFFE65100);
    } else if (largura < 900) {
      dispositivo = 'Tablet';
      icone = Icons.tablet_mac;
      cor = const Color(0xFF5C6BC0);
    } else {
      dispositivo = 'Desktop';
      icone = Icons.desktop_windows;
      cor = const Color(0xFF2E7D32);
    }

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: cor.withAlpha(25),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: cor.withAlpha(80)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icone, size: 16, color: cor),
              const SizedBox(width: 6),
              Text(
                '$dispositivo — ${largura.toInt()}px',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: cor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Escolhe o layout correto baseado na largura da tela
  Widget _buildResponsiveLayout(double largura, List<Widget> cards) {
    // MOBILE: < 600px → Column (1 card por linha)
    if (largura < 600) {
      return Column(
        children: cards
            .map((card) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: card,
                ))
            .toList(),
      );
    }
    // TABLET: 600-900px → Wrap (2 cards por linha, grid 2×2)
    else if (largura < 900) {
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: cards
            .map((card) => SizedBox(
                  width: (largura - 44) / 2,
                  child: card,
                ))
            .toList(),
      );
    }
    // DESKTOP: > 900px → Row (4 cards na mesma linha com Expanded)
    else {
      return Row(
        children: cards
            .asMap()
            .entries
            .map((entry) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: entry.key < cards.length - 1 ? 12 : 0,
                    ),
                    child: entry.value,
                  ),
                ))
            .toList(),
      );
    }
  }

  /// Tabela de estoque usando Stack + Positioned (bônus)
  Widget _buildTabelaEstoque() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Detalhes do Estoque',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              const SizedBox(height: 16),
              // Cabeçalho da tabela
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF263238),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('Modelo',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12))),
                    Expanded(
                        child: Text('Tam.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12))),
                    Expanded(
                        child: Text('Cor',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12))),
                    Expanded(
                        child: Text('Qtd.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                            textAlign: TextAlign.center)),
                    Expanded(
                        child: Text('Preço',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                            textAlign: TextAlign.right)),
                  ],
                ),
              ),
              // Linhas da tabela
              ...estoque.asMap().entries.map((entry) {
                final i = entry.key;
                final c = entry.value;
                final bool estoqueCritico = c.quantidade < 10;
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: i % 2 == 0
                        ? Colors.transparent
                        : Colors.grey.shade50,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(c.modelo,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500))),
                      Expanded(
                          child: Text(c.tamanho,
                              style: const TextStyle(fontSize: 13))),
                      Expanded(
                          child: Text(c.cor,
                              style: const TextStyle(fontSize: 13))),
                      Expanded(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: estoqueCritico
                                  ? const Color(0xFFE65100).withAlpha(20)
                                  : const Color(0xFF2E7D32).withAlpha(20),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${c.quantidade}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: estoqueCritico
                                    ? const Color(0xFFE65100)
                                    : const Color(0xFF2E7D32),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                              'R\$ ${c.preco.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 13),
                              textAlign: TextAlign.right)),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        // Badge sobreposto com Positioned (demonstra Stack)
        Positioned(
          top: 10,
          right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF5C6BC0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '10 itens',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
