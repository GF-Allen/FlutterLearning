import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

final _biggerFont = const TextStyle(fontSize: 18.0);

class RandonWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandonWords> {
  final _suggertions = <WordPair>[];
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
        //导航菜单
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return new Divider();
        }
        final index = i ~/ 2;
        if (index >= _suggertions.length) {
          _suggertions.addAll(generateWordPairs().take(10));
        }
        // 創建每一行
        return _buildRow(_suggertions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final isSaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  //跳转页面
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles,
          )
          .toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("收藏夹"),
        ),
        body: new ListView(children: divided),
      );
    }));
  }
}
