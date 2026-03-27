# Dashboard Responsivo - Estoque de Camisetas

## Sobre o Projeto

Dashboard responsivo em Flutter que exibe métricas de um estoque de camisetas, adaptando o layout automaticamente para mobile, tablet e desktop. Desenvolvido como atividade prática da **Aula 06 - Layouts Avançados** do curso de ADS.

## Autor

- **Nome:** Eduardo Jhonathan Passos Neumann
- **Curso:** Análise e Desenvolvimento de Sistemas - 5ª Fase
- **Instituição:** Faculdade Senac Joinville
- **Disciplina:** Desenvolvimento Mobile com Flutter
- **Professor:** Gabriel Caixeta Silva

## Funcionalidades

- 4 cards de métricas: total em estoque, modelos cadastrados, estoque baixo e valor total
- Layout responsivo com 3 breakpoints via `MediaQuery`
- Widget reutilizável `DashboardCard` (aceita título, valor, ícone e cor)
- Tabela detalhada de estoque com indicadores visuais de quantidade crítica
- Badge de breakpoint ativo mostrando dispositivo e largura em pixels
- Dados em memória com modelo `Camiseta`

### Breakpoints

| Dispositivo | Largura     | Layout                          |
|-------------|-------------|---------------------------------|
| Mobile      | < 600px     | `Column` — 1 card por linha     |
| Tablet      | 600 - 900px | `Wrap` — 2 cards por linha      |
| Desktop     | > 900px     | `Row` + `Expanded` — 4 em linha |

### Widgets Utilizados

- `MediaQuery` — detecção de largura da tela
- `Expanded` — distribuição de espaço no layout desktop
- `Wrap` — grid flexível no layout tablet
- `Stack` + `Positioned` — badge sobreposto na tabela de estoque
- `SingleChildScrollView` — scroll quando conteúdo excede a tela

## Screenshots

<!-- Substitua pelos screenshots reais do app rodando -->
![Mobile](screenshots/mobile.png)
![Tablet](screenshots/tablet.png)
![Desktop](screenshots/desktop.png)

## Como Rodar o Projeto

### Pré-requisitos

- Flutter SDK instalado ([guia de instalação](https://docs.flutter.dev/get-started/install))
- Editor de código (VS Code ou Android Studio)

### Passos

```bash
# 1. Clone o repositório
git clone https://github.com/EdNeu123/dashboard-responsivo-eduardo.git

# 2. Entre na pasta do projeto
cd dashboard-responsivo-eduardo

# 3. Instale as dependências
flutter pub get

# 4. Execute o app
flutter run
```

Para testar responsividade, rode no Chrome e redimensione a janela:
```bash
flutter run -d chrome
```

## Estrutura de Widgets

```
MaterialApp
└── Scaffold
    ├── AppBar
    └── SingleChildScrollView
        └── Column
            ├── Row (badge de breakpoint)
            ├── Column / Wrap / Row (layout responsivo)
            │   ├── DashboardCard (Total em Estoque)
            │   ├── DashboardCard (Modelos Cadastrados)
            │   ├── DashboardCard (Estoque Baixo)
            │   └── DashboardCard (Valor Total)
            └── Stack
                ├── Container (tabela de estoque)
                └── Positioned (badge "10 itens")
```

## Tecnologias

- **Flutter** 3.x
- **Dart** 3.x
- **Material Design 3**
