import 'package:flutter/material.dart';
import '../models/produto.dart';
import 'cadastro_produto.dart';
import 'detalhe_produto.dart';

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({super.key});

  @override
  State<ListaProdutos> createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  // Lista que armazena os produtos cadastrados
  List<Produto> produtos = [];

  // Navega para o cadastro e aguarda o retorno com await
  void _irParaCadastro() async {
    final produto = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CadastroProduto(),
      ),
    );

    // Verifica se retornou um produto (não apertou voltar)
    if (produto != null) {
      setState(() {
        produtos.add(produto);
      });
    }
  }

  // Navega para os detalhes passando o produto pelo construtor
  void _irParaDetalhe(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalheProduto(produto: produtos[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Produtos'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: produtos.isEmpty
          // Mensagem quando lista vazia
          ? const Center(
              child: Text(
                'Nenhum produto cadastrado.\nToque no + para adicionar!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          // Lista de produtos
          : ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final produto = produtos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(
                      produto.nome,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => _irParaDetalhe(index),
                  ),
                );
              },
            ),
      // FAB para adicionar produto
      floatingActionButton: FloatingActionButton(
        onPressed: _irParaCadastro,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
