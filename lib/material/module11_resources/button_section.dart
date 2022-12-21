import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  Column _buildButtonColumn(IconData icon, String label) {
    Color color = Colors.cyan.shade700;
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
    return Container(
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
  }
}
