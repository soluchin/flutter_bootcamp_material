import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Module9App extends StatelessWidget {
  const Module9App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Module 9",
      home: Scaffold(
        body: SafeArea(child: Layouting()),
      ),
    );
  }
}

class Layouting extends StatelessWidget {
  const Layouting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 70,
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              children: [
                Icon(Icons.phone),
                SizedBox(
                  height: 5,
                ),
                Text("CALL")
              ],
            ),
            Column(
              children: [
                Icon(Icons.double_arrow_sharp),
                SizedBox(
                  height: 5,
                ),
                Text("ROUTE")
              ],
            ),
            Column(
              children: [
                Icon(Icons.share),
                SizedBox(
                  height: 5,
                ),
                Text("SHARE")
              ],
            )
          ]),
        ],
      ),
    );
  }
}
