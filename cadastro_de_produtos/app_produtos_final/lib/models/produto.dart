class Produto {
  final String nome;
  final double preco;
  final String descricao;
  final String? imagemUrl;

  Produto({
    required this.nome,
    required this.preco,
    this.descricao = '',
    this.imagemUrl,
  });
}
