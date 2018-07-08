import 'package:flutter/material.dart';

class MaterialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "MaterialWiget",
      home: new TutorialHome(),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: "导航栏",
          onPressed: null,
        ),
        title: new Text("MaterialWidget"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: "搜索",
            onPressed: null,
          ),
        ],
      ),
      body: new Center(
        child: new Text("MaterialWidget"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        tooltip: "add",
        onPressed: null,
      ),
    );
  }
}
