import 'package:flutter/material.dart';

class Approach2 extends StatelessWidget {
  const Approach2({super.key, this.active = false, required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 120,
        decoration:
            BoxDecoration(color: active ? Colors.lightGreen[700] : Colors.grey),
        child: Center(
          child: Text(
            active ? "Active" : "InActive",
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
    ;
  }
}
