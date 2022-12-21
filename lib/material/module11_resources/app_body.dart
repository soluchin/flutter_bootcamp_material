import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/module11_resources/button_section.dart';
import 'package:bootcamp_material/material/module11_resources/text_section.dart';
import 'package:bootcamp_material/material/module11_resources/title_section.dart';

class Module11Body extends StatelessWidget {
  const Module11Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("images/lake.jpg"),
        TitleSection(),
        ButtonSection(),
        TextSection()
      ],
    );
  }
}
