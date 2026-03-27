import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/produto.dart';
import '../../routes/app_routes.dart';

class ListaProdutosScreen extends StatefulWidget {
  const ListaProdutosScreen({super.key});

  @override
  State<ListaProdutosScreen> createState() => _ListaProdutosScreenState();
}

class _ListaProdutosScreenState extends State<ListaProdutosScreen> {
  // Lista de produtos cadastrados (estado)
  final List<Produto> produtos = [];

  // Formatador de moeda brasileira
  final _formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  /// Navega para a tela de cadastro e aguarda o retorno do produto.
  /// Se o usuário salvar, o produto retornado é adicionado à lista.
  Future<void> _navegarParaCadastro() async {
    final produto = await Navigator.pushNamed(context, AppRoutes.cadastro);

    if (produto != null && produto is Produto) {
      setState(() {
        produtos.add(produto);
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${produto.nome} adicionado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  /// Navega para a tela de detalhes passando o produto como argumento.
  /// Aguarda retorno — se voltar 'deletar', remove o produto da lista.
  Future<void> _navegarParaDetalhe(int index) async {
    final resultado = await Navigator.pushNamed(
      context,
      AppRoutes.detalhe,
      arguments: produtos[index],
    );

    // BÔNUS: Se retornou 'deletar', remove o produto
    if (resultado == 'deletar') {
      final nomeRemovido = produtos[index].nome;
      setState(() {
        produtos.removeAt(index);
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$nomeRemovido removido!'),
          backgroundColor: Colors.red.shade400,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Produtos'),
        centerTitle: true,
      ),
      // Corpo: lista vazia ou ListView com os produtos
      body: produtos.isEmpty ? _buildListaVazia() : _buildLista(),
      // FAB (+) para navegar para a tela de cadastro
      floatingActionButton: FloatingActionButton(
        onPressed: _navegarParaCadastro,
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Widget exibido quando a lista está vazia
  Widget _buildListaVazia() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Nenhum produto cadastrado',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Toque no botão + para adicionar',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// ListView com os produtos cadastrados
  Widget _buildLista() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        final produto = produtos[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple.shade100,
              child: Text(
                produto.nome[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade700,
                ),
              ),
            ),
            title: Text(
              produto.nome,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              _formatoMoeda.format(produto.preco),
              style: TextStyle(color: Colors.green.shade700),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _navegarParaDetalhe(index),
          ),
        );
      },
    );
  }
}
