import 'package:flutter/material.dart';

class RowColumnExample extends StatelessWidget {
  RowColumnExample({super.key});

  Widget rowExample = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [BlueBox(), BlueBox(), BlueBox()],
  );

  Widget columnExample = Column(
    children: [BlueBox(), BlueBox(), BlueBox()],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: columnExample),
    );
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
    );
  }
}
