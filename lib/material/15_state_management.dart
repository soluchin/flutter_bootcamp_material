import 'package:flutter/material.dart';
import 'package:bootcamp_material/material/module15_resources/provider_example.dart';
import 'package:bootcamp_material/material/module15_resources/set_state_example.dart';

class Module15App extends StatelessWidget {
  const Module15App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Module15Home(),
        '/setstate': (context) => SetStateExample(),
        '/provider': (context) => ProviderExample(),
        //   '/multiprovider': (context) => MultiProviderExample(),
      },
    );
  }
}

class Module15Home extends StatelessWidget {
  const Module15Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "State Management Example:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/setstate');
                  },
                  child: Text("setState Example"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/provider');
                  },
                  child: Text("Provider Example"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/multiprovider');
                  },
                  child: Text("MultiProvider Example"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
