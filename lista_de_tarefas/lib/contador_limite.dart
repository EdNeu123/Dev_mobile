import 'package:flutter/material.dart';

class LimitePage extends StatefulWidget {
  @override
  State<LimitePage> createState() => _LimitePageState();
}

class _LimitePageState extends State<LimitePage> {
  int valor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contador com Limite')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(valor.toString(), style: TextStyle(fontSize: 48)),
          if (valor >= 10)
            Text('Limite atingido!', style: TextStyle(color: Colors.red)),
          ElevatedButton(
            onPressed: valor < 10 ? () => setState(() => valor++) : null,
            child: Text('Incrementar'),
          ),
        ],
      ),
    );
  }
}
