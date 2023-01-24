import 'package:flutter/material.dart';

import 'hangman_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
          centerTitle: true,
          title:  Text("HANGMAN GAME ",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.green[300],
              letterSpacing: 5,
            ),
          ),
        ),
        backgroundColor: Colors.black38,
        body: Hangman(),
      ),
    );
  }
}
