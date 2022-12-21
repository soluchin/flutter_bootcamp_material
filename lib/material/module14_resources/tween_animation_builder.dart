import 'package:flutter/material.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({super.key});

  @override
  State<TweenAnimationExample> createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample> {
  double size1 = 200;
  double size2 = 100;

  void _sizeChange() {
    setState(() {
      double temp = size1;
      size1 = size2;
      size2 = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: size1, end: size2),
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                builder: (context, value1, child) {
                  return TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: size2, end: size1),
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    builder: (context, value2, child) {
                      return Container(
                        width: value1,
                        height: value2,
                        decoration: BoxDecoration(color: Colors.amber),
                      );
                    },
                  );
                },
                onEnd: () => _sizeChange(),
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
