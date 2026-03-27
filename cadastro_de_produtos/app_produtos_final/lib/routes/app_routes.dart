import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../screens/lista/lista_produtos_screen.dart';
import '../screens/cadastro/cadastro_produto_screen.dart';
import '../screens/detalhe/detalhe_produto_screen.dart';

class AppRoutes {
  static const home = '/';
  static const cadastro = '/cadastro';
  static const detalhe = '/detalhe';

  /// Usa onGenerateRoute para passagem de dados type-safe
  /// e para implementar guards se necessário no futuro.
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const ListaProdutosScreen(),
        );

      case cadastro:
        return MaterialPageRoute<Produto>(
          builder: (_) => const CadastroProdutoScreen(),
        );

      case detalhe:
        final produto = settings.arguments as Produto;
        return MaterialPageRoute(
          builder: (_) => DetalheProdutoScreen(produto: produto),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Erro')),
            body: const Center(child: Text('Rota não encontrada!')),
          ),
        );
    }
  }
}
