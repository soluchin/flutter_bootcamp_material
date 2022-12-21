/**
 * The code below is the same program code as module 10 with modifications
 */

import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/module11_resources/app_body.dart';

class Module11App extends StatelessWidget {
  const Module11App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: Module11Body()),
      ),
    );
  }
}
