import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Primeiro App',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.from(
            alpha: 0.5,
            red: 210,
            green: 125,
            blue: 125,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu menu que é ruim para daltônico"),
          backgroundColor: Colors.greenAccent,
        ),
        body: Container(
          alignment: .center,
          width: 500 ,
          color: Colors.blue,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: .spaceAround,
            children: [
              Image.asset('pinguim.jpg', width: 64, height: 64),    
              Text(
                "elemento 01 fdsafdsa",
                style: TextStyle(
                  color: Color.fromARGB(218, 212, 208, 6),
                  wordSpacing: 10,
                  fontSize: 32,
                ),
              ),
              Text("elemento 02", style: TextStyle(letterSpacing: 20)),
              Text("elemento 03", 
                style: TextStyle( fontSize:32, shadows: [Shadow(color: Colors.deepOrange,offset: Offset.fromDirection(2.3), blurRadius: .5)]),),
              Text("elemento 04"),
              Icon(Icons.tips_and_updates, color: Colors.pink, size: 64),
            ],
          ),
        ),
      ),
    );
  }
}
