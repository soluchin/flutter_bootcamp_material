import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/module14_resources/implicit_animation.dart';
import 'package:bootcamp_material/material/module14_resources/tween_animation_builder.dart';

class Module14App extends StatelessWidget {
  const Module14App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "animations",
        home: TweenAnimationExample());
  }
}
