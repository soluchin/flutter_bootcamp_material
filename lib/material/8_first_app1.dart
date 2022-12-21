import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FirstApp1 extends StatelessWidget {
  FirstApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white, foregroundColor: Colors.black)),
        title: "My First App",
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  RandomWords({super.key});
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>[];
  final _biggerfont = const TextStyle(fontSize: 18);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      final tiles = widget._saved.map((pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: widget._biggerfont,
          ),
        );
      });
      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(context: context, tiles: tiles).toList()
          : <Widget>[];
      return Scaffold(
        appBar: AppBar(title: const Text("Saved Suggestion")),
        body: ListView(children: divided),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
        appBar: AppBar(
          title: const Text("English Words Generator"),
          actions: [IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))],
        ),
        body: ListView.builder(itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= widget._suggestions.length) {
            widget._suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved =
              widget._saved.contains(widget._suggestions[index]);

          return ListTile(
            title: Text(
              widget._suggestions[index].asPascalCase,
              style: widget._biggerfont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? "removed from saved" : "saved",
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  widget._saved.remove(widget._suggestions[index]);
                } else {
                  widget._saved.add(widget._suggestions[index]);
                }
              });
            },
          );
        }));
  }
}
