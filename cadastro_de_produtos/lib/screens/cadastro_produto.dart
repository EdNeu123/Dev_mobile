import 'package:flutter/material.dart';
import '../models/produto.dart';

class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  // TextEditingController para cada campo
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _descricaoController = TextEditingController();

  // Mensagem de erro (vazia = sem erro)
  String _erro = '';

  // Salva o produto e retorna para a Tela 1 via pop
  void _salvar() {
    final nome = _nomeController.text.trim();
    // Aceita vírgula como decimal (teclado BR)
    final precoTexto = _precoController.text.trim().replaceAll(',', '.');

    // Validação: nome não pode estar vazio
    if (nome.isEmpty) {
      setState(() {
        _erro = 'Informe o nome do produto.';
      });
      return;
    }

    // Validação: preço não pode estar vazio
    if (precoTexto.isEmpty) {
      setState(() {
        _erro = 'Informe o preço do produto.';
      });
      return;
    }

    // Validação: preço precisa ser um número válido
    final preco = double.tryParse(precoTexto);
    if (preco == null) {
      setState(() {
        _erro = 'Preço inválido. Use apenas números.';
      });
      return;
    }

    // Validação: preço não pode ser zero ou negativo
    if (preco <= 0) {
      setState(() {
        _erro = 'O preço deve ser maior que zero.';
      });
      return;
    }

    // Tudo válido — cria o produto e retorna para a tela anterior
    final produto = Produto(
      nome: nome,
      preco: preco,
      descricao: _descricaoController.text.trim(),
    );

    Navigator.pop(context, produto);
  }

  // Libera os controllers no dispose (ciclo de vida - Aula 7)
  @override
  void dispose() {
    _nomeController.dispose();
    _precoController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Produto'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      // SingleChildScrollView evita overflow quando o teclado abre
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Campo: Nome
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do Produto',
              ),
            ),

            const SizedBox(height: 16),

            // Campo: Preço
            TextField(
              controller: _precoController,
              decoration: const InputDecoration(
                labelText: 'Preço',
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),

            // Campo: Descrição
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição (opcional)',
              ),
            ),

            const SizedBox(height: 16),

            // Mensagem de erro (aparece só quando _erro não está vazio)
            if (_erro.isNotEmpty)
              Text(
                _erro,
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),

            const SizedBox(height: 24),

            // Botão Salvar
            ElevatedButton(
              onPressed: _salvar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
              ),
              child: const Text(
                'Salvar',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
