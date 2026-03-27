import 'package:flutter/material.dart';
import '../../models/produto.dart';

class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({super.key});

  @override
  State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  // Controllers para os campos de texto
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _imagemUrlController = TextEditingController();

  // Chave do formulário para validação
  final _formKey = GlobalKey<FormState>();

  /// Valida os campos e retorna o produto criado para a tela anterior via pop().
  void _salvarProduto() {
    // Valida o formulário (campos obrigatórios)
    if (!_formKey.currentState!.validate()) return;

    final produto = Produto(
      nome: _nomeController.text.trim(),
      preco: double.parse(_precoController.text.replaceAll(',', '.')),
      descricao: _descricaoController.text.trim(),
      imagemUrl: _imagemUrlController.text.trim().isNotEmpty
          ? _imagemUrlController.text.trim()
          : null,
    );

    // Retorna o produto para a tela anterior (Tela 1)
    Navigator.pop(context, produto);
  }

  @override
  void dispose() {
    // Libera os controllers para evitar memory leaks
    _nomeController.dispose();
    _precoController.dispose();
    _descricaoController.dispose();
    _imagemUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Produto'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ícone decorativo no topo
              Icon(
                Icons.add_shopping_cart,
                size: 64,
                color: Colors.deepPurple.shade200,
              ),
              const SizedBox(height: 24),

              // Campo: Nome do Produto
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Produto',
                  hintText: 'Ex: Camiseta Flutter',
                  prefixIcon: Icon(Icons.label_outline),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o nome do produto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo: Preço
              TextFormField(
                controller: _precoController,
                decoration: const InputDecoration(
                  labelText: 'Preço (R\$)',
                  hintText: 'Ex: 49.90',
                  prefixIcon: Icon(Icons.attach_money),
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o preço';
                  }
                  final preco =
                      double.tryParse(value.replaceAll(',', '.'));
                  if (preco == null || preco <= 0) {
                    return 'Informe um preço válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo: Descrição (opcional)
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(
                  labelText: 'Descrição (opcional)',
                  hintText: 'Ex: Camiseta 100% algodão',
                  prefixIcon: Icon(Icons.description_outlined),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),

              // BÔNUS: Campo de imagem (URL)
              TextFormField(
                controller: _imagemUrlController,
                decoration: const InputDecoration(
                  labelText: 'URL da Imagem (opcional)',
                  hintText: 'https://exemplo.com/imagem.png',
                  prefixIcon: Icon(Icons.image_outlined),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 32),

              // Botão Salvar
              FilledButton.icon(
                onPressed: _salvarProduto,
                icon: const Icon(Icons.save),
                label: const Text('Salvar Produto'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
