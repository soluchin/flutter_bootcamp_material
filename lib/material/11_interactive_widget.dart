import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/module11_2_resources/approach1.dart';
import 'package:bootcamp_material/material/module11_2_resources/approach2.dart';

class Module11App2 extends StatefulWidget {
  const Module11App2({super.key});

  @override
  State<Module11App2> createState() => _Module11App2State();
}

class _Module11App2State extends State<Module11App2> {
  bool _active = false;
  void _handleTap(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Interactive Widget",
      home: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Center(child: Approach1()),
              SizedBox(
                height: 100,
              ),
              Center(
                  child: Approach2(
                active: _active,
                onChanged: _handleTap,
              ))
            ],
          ),
        )),
      ),
    );
  }
}
