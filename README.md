# Cartão de Visita Digital - Flutter

## Sobre o Projeto

Aplicativo Flutter que exibe um cartão de visita digital personalizado, desenvolvido como atividade prática da **Aula 05 - Widgets e UI** do curso de Análise e Desenvolvimento de Sistemas.

O app apresenta informações profissionais de forma organizada, utilizando widgets básicos de layout e estilização do Flutter.

## Autor

- **Nome:** Eduardo Jhonathan Passos Neumann
- **Curso:** Análise e Desenvolvimento de Sistemas - 5ª Fase
- **Instituição:** Faculdade Senac Joinville
- **Disciplina:** Desenvolvimento Mobile com Flutter
- **Professor:** Gabriel Caixeta Silva

## Funcionalidades

- Nome completo com destaque visual (fonte grande, bold)
- Título profissional com chip estilizado
- Informações de contato (e-mail e telefone) com ícones
- Link do GitHub
- Instituição de ensino

### Elementos Bônus Implementados

- `CircleAvatar` com borda gradiente
- Ícones (`Icon`) para cada informação de contato
- Bordas arredondadas (`borderRadius`)
- Sombras (`boxShadow`) para profundidade
- Gradiente no container principal (`LinearGradient`)
- Tema dark personalizado com paleta teal

## Screenshots

<!-- Adicione aqui os screenshots do app rodando -->
![Screenshot do App](screenshots/screenshot.png)

> **Nota:** Substitua o caminho acima pelo screenshot real do app rodando.

## Como Rodar o Projeto

### Pré-requisitos

- Flutter SDK instalado ([guia de instalação](https://docs.flutter.dev/get-started/install))
- Editor de código (VS Code ou Android Studio)
- Git instalado

### Passos

```bash
# 1. Clone o repositório
git clone https://github.com/EdNeu123/cartao-visita-flutter-eduardo.git

# 2. Entre na pasta do projeto
cd cartao-visita-flutter-eduardo

# 3. Instale as dependências
flutter pub get

# 4. Execute o app
flutter run
```

Para rodar no navegador (Chrome):
```bash
flutter run -d chrome
```

Para rodar no Edge:
```bash
flutter run -d edge
```

## Tecnologias Utilizadas

- **Flutter** 3.x
- **Dart** 3.x
- **Material Design 3**

## Estrutura de Widgets

```
MaterialApp
└── Scaffold
    ├── AppBar
    └── Center
        └── SingleChildScrollView
            └── Container (gradiente + sombra)
                └── Column
                    ├── CircleAvatar (com borda gradiente)
                    ├── Text (nome)
                    ├── Container (chip do título)
                    ├── Row (divisor customizado)
                    ├── Row (e-mail)
                    ├── Row (telefone)
                    ├── Row (GitHub)
                    └── Row (instituição)
```
