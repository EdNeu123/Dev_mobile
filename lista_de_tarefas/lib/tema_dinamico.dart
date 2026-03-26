import 'package:flutter/material.dart';

class TemaPage extends StatefulWidget {
  @override
  State<TemaPage> createState() => _TemaPageState();
}

class _TemaPageState extends State<TemaPage> {
  bool temaEscuro = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: temaEscuro ? Colors.black : Colors.white,
      appBar: AppBar(title: Text('Tema Dinâmico')),
      body: Center(
        child: SwitchListTile(
          title: Text('Tema escuro'),
          value: temaEscuro,
          onChanged: (v) => setState(() => temaEscuro = v),
        ),
      ),
    );
  }
}
