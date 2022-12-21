import 'package:flutter/material.dart';

class HelloWorld2 extends StatelessWidget {
  const HelloWorld2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to Flutter"),
        ),
        body: const Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
