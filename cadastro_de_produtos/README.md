# App de Cadastro de Produtos

**Atividade Prática — Aula 08: Navegação e Rotas no Flutter**

---

## Aluno

Eduardo Jhonathan Passos Neumann  
ADS — 5ª Fase | Faculdade Senac Joinville | 2026/1

---

## Descrição

Aplicativo Flutter com múltiplas telas e navegação entre elas. O app permite cadastrar produtos, listar os produtos cadastrados e visualizar os detalhes de cada um, praticando Navigator, push/pop e passagem de dados.

---

## Funcionalidades

- **Tela 1 — Lista de Produtos:** exibe produtos cadastrados (nome e preço), mensagem quando lista vazia, FAB (+) para adicionar, toque no item para ver detalhes
- **Tela 2 — Cadastro:** campos para nome, preço e descrição, validação (campos vazios, preço negativo/zero), retorna produto criado para a Tela 1
- **Tela 3 — Detalhes:** recebe e exibe o produto com nome, preço formatado (R$) e descrição, imagem placeholder
- **Bônus:** Formatação de preço no padrão brasileiro (R$ 0,00 com vírgula)

---

## Screenshots

> Adicionar screenshots das 3 telas aqui:
> - Lista de produtos (vazia e com itens)
> - Formulário de cadastro
> - Detalhes do produto

---

## Fluxo de navegação

```
Lista de Produtos
  │
  ├── FAB (+) ──→ Cadastro ──→ pop(produto) ──→ Lista (com novo produto)
  │
  └── Tocar no item ──→ Detalhes ──→ Voltar (←) ──→ Lista
```

---

## Conceitos aplicados

- `Navigator.push()` com `MaterialPageRoute` para navegar entre telas
- `Navigator.pop(context, produto)` para retornar dados
- `await` no `Navigator.push()` para receber dados de retorno
- Verificação de `null` antes de adicionar à lista
- `StatefulWidget` + `setState()` na Tela 1 para atualizar a lista
- `TextEditingController` + `dispose()` na Tela 2
- Passagem de dados via construtor (Tela 1 → Tela 3)
- Classe `Produto` em arquivo separado (`models/produto.dart`)

---

## Estrutura do projeto

```
lib/
├── main.dart
├── models/
│   └── produto.dart
└── screens/
    ├── lista_produtos.dart
    ├── cadastro_produto.dart
    └── detalhe_produto.dart
```

---

## Como executar

```bash
cd app_produtos
flutter pub get
flutter run
```
