import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/produto.dart';

class DetalheProdutoScreen extends StatelessWidget {
  // Recebe o produto via construtor (type-safe)
  final Produto produto;

  const DetalheProdutoScreen({super.key, required this.produto});

  // Formatador de moeda brasileira
  static final _formatoMoeda =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  /// BÔNUS: Confirma e retorna 'deletar' para a Tela 1 remover o produto.
  void _confirmarExclusao(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Excluir Produto'),
        content: Text('Deseja realmente excluir "${produto.nome}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx), // Fecha o dialog
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx); // Fecha o dialog
              Navigator.pop(context, 'deletar'); // Retorna 'deletar' pra Tela 1
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        centerTitle: true,
        actions: [
          // BÔNUS: Botão de deletar na AppBar
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Excluir produto',
            onPressed: () => _confirmarExclusao(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem placeholder ou URL do produto
            Card(
              clipBehavior: Clip.antiAlias,
              child: produto.imagemUrl != null && produto.imagemUrl!.isNotEmpty
                  ? Image.network(
                      produto.imagemUrl!,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _buildImagePlaceholder(),
                    )
                  : _buildImagePlaceholder(),
            ),
            const SizedBox(height: 16),

            // Card com informações do produto
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nome
                    Text(
                      produto.nome,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),

                    // Preço com destaque
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _formatoMoeda.format(produto.preco),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Descrição
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      'Descrição',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      produto.descricao.isNotEmpty
                          ? produto.descricao
                          : 'Sem descrição disponível.',
                      style: TextStyle(
                        fontSize: 16,
                        color: produto.descricao.isNotEmpty
                            ? null
                            : Colors.grey,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Placeholder quando não há imagem
  Widget _buildImagePlaceholder() {
    return Container(
      height: 220,
      color: Colors.deepPurple.shade50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_outlined, size: 64, color: Colors.deepPurple.shade200),
            const SizedBox(height: 8),
            Text(
              'Sem imagem',
              style: TextStyle(color: Colors.deepPurple.shade300),
            ),
          ],
        ),
      ),
    );
  }
}
