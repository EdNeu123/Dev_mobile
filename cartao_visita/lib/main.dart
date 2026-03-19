import 'package:flutter/material.dart';

void main() {
  runApp(const CartaoVisita());
}

class CartaoVisita extends StatelessWidget {
  const CartaoVisita({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cartão de Visita - Eduardo Neumann',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  // Cores do tema
  static const Color corPrimaria = Color(0xFF0D1B2A);
  static const Color corSecundaria = Color(0xFF1B2D45);
  static const Color corDestaque = Color(0xFF00BFA6);
  static const Color corTexto = Colors.white;
  static const Color corTextoSecundario = Color(0xFFB0BEC5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corPrimaria,
      appBar: AppBar(
        title: const Text(
          "Cartão de Visita Digital",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: corSecundaria,
        foregroundColor: corTexto,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 380,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [corSecundaria, Color(0xFF162232)],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: corDestaque.withAlpha(60),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(100),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: corDestaque.withAlpha(30),
                  blurRadius: 30,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Avatar com borda estilizada
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [corDestaque, Color(0xFF00897B)],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/foto.png'),
                  ),
                ),
                const SizedBox(height: 20),

                // Nome completo
                const Text(
                  "Eduardo Jhonathan\nPassos Neumann",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: corTexto,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),

                // Título profissional com chip estilizado
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: corDestaque.withAlpha(30),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: corDestaque.withAlpha(80),
                    ),
                  ),
                  child: const Text(
                    "Analista de Sistemas",
                    style: TextStyle(
                      fontSize: 15,
                      color: corDestaque,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Divisor estilizado
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: corDestaque.withAlpha(40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.diamond_outlined,
                        color: corDestaque.withAlpha(120),
                        size: 16,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: corDestaque.withAlpha(40),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Informações de contato
                _buildInfoRow(
                  Icons.email_outlined,
                  "eduardo.neumann@totvs.com.br",
                ),
                const SizedBox(height: 14),
                _buildInfoRow(
                  Icons.phone_outlined,
                  "(47) 98820-7170",
                ),
                const SizedBox(height: 14),
                _buildInfoRow(
                  Icons.code_rounded,
                  "github.com/EdNeu123",
                ),
                const SizedBox(height: 14),
                _buildInfoRow(
                  Icons.school_outlined,
                  "ADS - Faculdade Senac Joinville",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Constrói uma linha de informação de contato com ícone
  Widget _buildInfoRow(IconData icone, String texto) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: corDestaque.withAlpha(25),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icone, color: corDestaque, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 14,
              color: corTextoSecundario,
            ),
          ),
        ),
      ],
    );
  }
}
