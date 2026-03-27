class Habito {
  String nome;
  String descricao;
  bool concluido;

  Habito({
    required this.nome,
    this.descricao = '',
    this.concluido = false,
  });
}
