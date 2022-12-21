import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ImplicitAnimationsExample extends StatefulWidget {
  const ImplicitAnimationsExample({super.key});

  @override
  State<ImplicitAnimationsExample> createState() =>
      _ImplicitAnimationsExampleState();
}

class _ImplicitAnimationsExampleState extends State<ImplicitAnimationsExample> {
  bool _bigger = false;

  void _buttonHandler() {
    setState(() {
      _bigger = !_bigger;
    });
  }

  late AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text("Without animation:"),
            ),
            Container(
              child: Image.asset("images/lake.jpg"),
              width: _bigger ? 300 : 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 8),
              child: Text("Using animation:"),
            ),
            AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              child: Image.asset("images/lake.jpg"),
              width: _bigger ? 300 : 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              duration: Duration(seconds: 2),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => _buttonHandler(),
                child: Text(_bigger ? "Make it smaller" : "Make it bigger!"))
          ],
        ),
      )),
    );
  }
}
