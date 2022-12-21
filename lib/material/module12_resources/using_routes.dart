import 'package:flutter/material.dart';

class Page1Rout extends StatelessWidget {
  const Page1Rout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Landing Page"),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/page2");
              },
              child: Text("go to other page")),
        ],
      ),
    )));
    ;
  }
}

class Page2Rout extends StatelessWidget {
  const Page2Rout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Other Page"),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("go back")),
        ],
      ),
    )));
    ;
  }
}
