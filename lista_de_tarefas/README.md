# To-Do List

**Atividade Prática — Aula 07: Gerenciamento de Estado Básico**

---

## Aluno

Eduardo Jhonathan Passos Neumann  
ADS — 5ª Fase | Faculdade Senac Joinville | 2026/1

---

## Descrição

Aplicativo Flutter de lista de tarefas (To-Do List) interativo com gerenciamento de estado. O usuário pode adicionar, marcar como concluída e remover tarefas.

---

## Funcionalidades

- Adicionar tarefas via TextField + botão
- Marcar/desmarcar tarefas como concluídas (Checkbox)
- Texto riscado (`TextDecoration.lineThrough`) quando concluída
- Cores diferentes para tarefas pendentes e concluídas
- Remover tarefas individualmente (ícone lixeira)
- Mensagem quando a lista está vazia
- Limpar campo após adicionar
- **Bônus:** Contador de tarefas totais e concluídas
- **Bônus:** Botão para limpar todas as concluídas
- **Bônus:** Cores diferenciadas (verde para concluída)

---

## Screenshots

> Adicionar screenshots aqui:
> - Lista vazia
> - Com tarefas adicionadas
> - Tarefas concluídas (riscadas)

---

## Conceitos aplicados

- `StatefulWidget` para gerenciar estado
- `setState()` em todas as modificações (adicionar, marcar, remover)
- `TextEditingController` para capturar entrada do usuário
- `dispose()` para liberar o controller
- `List<Tarefa>` para armazenar dados
- Classe `Tarefa` com `String titulo` e `bool concluida`
- `ListView.builder` para renderizar a lista
- `Checkbox` para interatividade
- `Card` e `ListTile` para layout dos itens

---

## Estrutura do projeto

```
lib/
├── main.dart
├── models/
│   └── tarefa.dart
└── screens/
    └── todo_screen.dart
```

---

## Como executar

```bash
cd todo_list
flutter pub get
flutter run
```
