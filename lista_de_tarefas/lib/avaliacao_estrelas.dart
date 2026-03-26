import 'package:flutter/material.dart';

class AvaliacaoPage extends StatefulWidget {
  @override
  State<AvaliacaoPage> createState() => _AvaliacaoPageState();
}

class _AvaliacaoPageState extends State<AvaliacaoPage> {
  int estrelas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avaliação')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (i) => IconButton(
              icon: Icon(
                Icons.star,
                color: i < estrelas ? Colors.amber : Colors.grey,
              ),
              onPressed: () => setState(() => estrelas = i + 1),
            ),
          ),
        ),
      ),
    );
  }
}
