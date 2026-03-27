# Dashboard Responsivo

**Atividade Prática — Aula 06: Layouts Avançados e Responsividade**

---

## Aluno

Eduardo Jhonathan Passos Neumann  
ADS — 5ª Fase | Faculdade Senac Joinville | 2026/1

---

## Descrição

Dashboard responsivo em Flutter que se adapta automaticamente a diferentes tamanhos de tela (mobile, tablet e desktop) usando MediaQuery e breakpoints.

---

## Funcionalidades

- 4 cards de métricas com ícone, título, valor e cor personalizada
- Widget reutilizável `DashboardCard`
- Layout responsivo com 3 breakpoints:
  - **Mobile (< 600px):** Column — 1 card por linha
  - **Tablet (600–900px):** Wrap — 2 cards por linha
  - **Desktop (> 900px):** Row com Expanded — 4 cards na mesma linha

---

## Screenshots

> Adicionar 3 screenshots (mobile, tablet, desktop) aqui.

---

## Conceitos aplicados

- `MediaQuery.of(context).size.width` para detectar largura da tela
- Lógica condicional `if/else` para alternar layouts
- `Expanded` para distribuir espaço igualmente
- `Wrap` para quebrar cards em 2 colunas
- `Column` e `Row` para organização
- `Container` com `BoxDecoration` e `borderRadius`
- Widget reutilizável (`DashboardCard`) com parâmetros
- `SingleChildScrollView` para evitar overflow

---

## Fluxo de responsividade

```
largura < 600px   →  Column (vertical, 1 card por linha)
600px ≤ largura < 900px  →  Wrap (grid 2×2)
largura ≥ 900px   →  Row + Expanded (horizontal, 4 cards)
```

---

## Como executar

```bash
cd dashboard_responsivo
flutter pub get
flutter run
```

Para testar os breakpoints, redimensione a janela no desktop ou use o Device Preview.
