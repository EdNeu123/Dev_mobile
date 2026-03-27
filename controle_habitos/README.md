# Controle de Hábitos

**Miniprojeto Flutter — Atividade Prática Avaliativa de Revisão**

---

## Aluno

Eduardo Jhonathan Passos Neumann  
ADS — 5ª Fase | Faculdade Senac Joinville | 2026/1

---

## Descrição

Aplicativo Flutter para controle de hábitos pessoais do dia a dia. O app permite visualizar uma lista de hábitos, marcar como concluídos, adicionar novos, remover existentes e ver detalhes de cada hábito. Utiliza carregamento assíncrono simulado e navegação entre duas telas.

---

## Funcionalidades

- Lista de hábitos pré-carregados (Beber água, Estudar, Exercitar-se, Ler, Meditar)
- Carregamento inicial simulado com `async/await` e `Future.delayed`
- Marcar hábitos como concluídos via Checkbox
- Visual diferenciado para concluídos (texto riscado + cor verde)
- Adicionar novos hábitos via TextField
- Remover hábitos individualmente (ícone lixeira)
- Limpar todos os concluídos de uma vez (botão na AppBar)
- Contador de hábitos totais e concluídos
- Navegação para tela de detalhes com informações do hábito
- Passagem de dados entre telas via construtor

---

## Screenshots

> Adicionar screenshots aqui:
> - Tela de carregamento
> - Lista com hábitos pendentes
> - Hábitos marcados como concluídos
> - Tela de detalhes

---

## Estrutura do projeto

```
lib/
├── main.dart
├── models/
│   └── habito.dart
└── screens/
    ├── home_screen.dart
    └── habit_details_screen.dart
```

---

## Conceitos aplicados (revisão geral)

| Aula | Conceito | Uso no projeto |
|------|----------|----------------|
| Aula 02 | Classes e construtores | Classe `Habito` com `nome`, `descricao`, `concluido` |
| Aula 03 | async/await, Future.delayed | Simulação de carregamento inicial dos hábitos |
| Aula 05 | Widgets básicos | Text, Container, Column, Icon, Scaffold, AppBar |
| Aula 07 | StatefulWidget, setState | Gerenciar lista de hábitos, marcar/adicionar/remover |
| Aula 07 | initState, dispose | Carregar dados na inicialização, liberar controller |
| Aula 07 | TextField, Checkbox | Entrada de dados e interatividade |
| Aula 08 | Navigator.push | Navegação para tela de detalhes |
| Aula 08 | Passagem de dados | Hábito enviado via construtor para tela de detalhes |

---

## Fluxo do app

```
[Carregando...]  ──(2s)──→  Lista de Hábitos
                                  │
                                  ├── Checkbox ──→ Marca/desmarca concluído
                                  ├── Lixeira ──→ Remove hábito
                                  ├── TextField + botão ──→ Adiciona novo
                                  ├── Vassoura (AppBar) ──→ Limpa concluídos
                                  └── Tocar no item ──→ Tela de Detalhes
```

---

## Como executar

```bash
cd controle_habitos
flutter pub get
flutter run
```
