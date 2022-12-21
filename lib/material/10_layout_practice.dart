import 'package:flutter/material.dart';

class Module10App extends StatelessWidget {
  Module10App({super.key});

  Widget titleSection = Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Oeschen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Kandersteg, Switzerland",
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star,
              color: Colors.amber,
            )),
        Text("40")
      ],
    ),
  );

  late Widget buttonSection = Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(Icons.call, "CALL"),
        _buildButtonColumn(Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Icons.share, 'SHARE'),
      ],
    ),
  );

  Widget textSection = const Padding(
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );

  Column _buildButtonColumn(IconData icon, String label) {
    Color color = Colors.amber;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: color),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Module10",
      home: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Image.asset("images/lake.jpg"),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      )),
    );
  }
}
