import 'package:flutter/material.dart';

class IconExample extends StatelessWidget {
  IconExample({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: const [
          Icon(
            Icons.widgets,
            size: 50,
            color: Colors.blue,
          ),
          Icon(
            Icons.widgets,
            size: 50,
            color: Colors.red,
          ),
        ],
      )),
    );
  }
}
