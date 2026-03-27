import 'package:flutter/material.dart';
import '../models/produto.dart';

class DetalheProduto extends StatelessWidget {
  // Recebe o produto da Tela 1 via construtor
  final Produto produto;

  const DetalheProduto({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem placeholder
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              child: const Icon(
                Icons.image,
                size: 80,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 24),

            // Nome do produto
            Text(
              produto.nome,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Preço
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              color: Colors.deepPurple[50],
              child: Text(
                'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
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
              produto.descricao.isEmpty
                  ? 'Sem descrição'
                  : produto.descricao,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
