import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  ExpandedExample({super.key});

  Widget rowExample = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(flex: 3, child: BlueBox()),
      Expanded(flex: 2, child: BlueBox()),
      Expanded(flex: 1, child: BlueBox())
    ],
  );

  Widget columnExample = Column(
    children: [
      Expanded(child: BlueBox()),
      Expanded(child: BlueBox()),
      Expanded(child: BlueBox())
    ],
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
