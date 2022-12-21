import 'package:flutter/material.dart';

class TitleSection extends StatefulWidget {
  TitleSection({super.key});

  bool _isFavorited = false;
  int _favoriteCount = 39;

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  void _favButton() {
    setState(() {
      widget._isFavorited = !widget._isFavorited;
      widget._isFavorited
          ? widget._favoriteCount += 1
          : widget._favoriteCount -= 1;
      // if (widget._isFavorited) {
      //   widget._isFavorited = false;
      //   widget._favoriteCount -= 1;
      // } else {
      //   widget._isFavorited = true;
      //   widget._favoriteCount += 1;
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onPressed: () {
                _favButton();
              },
              icon: Icon(
                widget._isFavorited ? Icons.star : Icons.star_border_rounded,
                color: widget._isFavorited ? Colors.amber : Colors.grey,
              )),
          Text("${widget._favoriteCount}")
        ],
      ),
    );
  }
}
