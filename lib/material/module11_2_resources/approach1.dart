import 'package:flutter/material.dart';

/**
 * The widget manages its own state 
 * Sometimes it makes the most sense for the widget to manage its state internally.*/

class Approach1 extends StatefulWidget {
  const Approach1({super.key});

  @override
  State<Approach1> createState() => _Approach1State();
}

class _Approach1State extends State<Approach1> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 120,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey),
        child: Center(
          child: Text(
            _active ? "Active" : "InActive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
