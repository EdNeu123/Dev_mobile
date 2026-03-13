import 'package:flutter/material.dart';

void main() {
  runApp(const CartaoVisitaApp());
}

class CartaoVisitaApp extends StatelessWidget {
  const CartaoVisitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartão de Visita',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const CartaoVisita(),
    );
  }
}

class CartaoVisita extends StatelessWidget {
  const CartaoVisita({super.key});

  // ── Cores do tema ──
  static const Color azulPrimario = Color(0xFF1B3A5C);
  static const Color azulClaro = Color(0xFF2C5F8A);
  static const Color begeClaro = Color(0xFFF5F0E8);
  static const Color begeMedio = Color(0xFFE8DFD0);
  static const Color textoCinza = Color(0xFF6B6B6B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: begeClaro,
      body: Center(
        child: Container(
          width: 360,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: azulPrimario.withOpacity(0.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Header azul com avatar ──
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 32),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [azulPrimario, azulClaro],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    // Avatar
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: begeMedio, width: 3),
                      ),
                      child: const CircleAvatar(
                        radius: 48,
                        backgroundColor: begeMedio,
                        child: Icon(
                          Icons.person,
                          size: 52,
                          color: azulPrimario,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Nome
                    const Text(
                      'Eduardo Neuhaus',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Título profissional
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Desenvolvedor Full Stack',
                        style: TextStyle(
                          fontSize: 14,
                          color: begeMedio,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── Informações de contato ──
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    _buildContatoItem(
                      icon: Icons.email_outlined,
                      texto: 'eduardo@email.com',
                    ),
                    const SizedBox(height: 16),
                    _buildContatoItem(
                      icon: Icons.phone_outlined,
                      texto: '(47) 99999-9999',
                    ),
                    const SizedBox(height: 16),
                    _buildContatoItem(
                      icon: Icons.location_on_outlined,
                      texto: 'Joinville, SC',
                    ),
                    const SizedBox(height: 16),
                    _buildContatoItem(
                      icon: Icons.language_outlined,
                      texto: 'github.com/EdNeu123',
                    ),
                    const SizedBox(height: 16),
                    _buildContatoItem(
                      icon: Icons.code_outlined,
                      texto: 'linkedin.com/in/eduardo',
                    ),
                  ],
                ),
              ),

              // ── Footer com frase ──
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  color: begeMedio,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Text(
                  'Transformando ideias em código ✨',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: azulPrimario,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget reutilizável para cada linha de contato
  Widget _buildContatoItem({
    required IconData icon,
    required String texto,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: begeClaro,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: azulPrimario, size: 22),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            texto,
            style: const TextStyle(
              fontSize: 15,
              color: textoCinza,
            ),
          ),
        ),
      ],
    );
  }
}