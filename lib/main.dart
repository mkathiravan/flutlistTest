import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(title: "List in Flutter",home: new Scaffold(appBar: new AppBar(title: Text("List"),)
       ,body: RandomWords(),),);
  }

}

class RandomWords extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {

  final _suggestion = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text('Startup Name Generator'),),
      body: _buildSuggestion(),);
  }


  Widget _buildSuggestion() {
    return new ListView.builder(
        padding: const EdgeInsets.all(10.0), itemBuilder: (context, i) {
      if (i.isOdd)
        return Divider();

      final index = i ~/ 2;

      if (index >= _suggestion.length) {
        _suggestion.addAll(generateWordPairs().take(10));
      }

      return _buildRow(_suggestion[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(pair.asPascalCase, style: _biggerFont),
    );
  }


}