import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/module12_resources/using_navigator.dart';
import 'package:bootcamp_material/material/module12_resources/using_routes.dart';

/**Class below using Navigator to move to the next page */
class Module12App1 extends StatelessWidget {
  const Module12App1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "navigator",
        home: Page1Nav());
  }
}

class Module12App2 extends StatelessWidget {
  const Module12App2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "navigator",
      initialRoute: "/",
      routes: {
        "/": (context) => const Page1Rout(),
        "/page2": (context) => const Page2Rout()
      },
    );
  }
}
