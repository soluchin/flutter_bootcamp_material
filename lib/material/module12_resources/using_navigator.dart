import 'package:flutter/material.dart';

class Page1Nav extends StatelessWidget {
  const Page1Nav({super.key});

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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Page2Nav();
                  },
                ));
              },
              child: Text("go to other page")),
        ],
      ),
    )));
  }
}

class Page2Nav extends StatelessWidget {
  const Page2Nav({super.key});

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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Page1Nav();
                  },
                ));
              },
              child: Text("go back")),
        ],
      ),
    )));
  }
}
