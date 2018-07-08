import 'package:flutter/material.dart';
import 'base_page.dart';
import 'listview_demo.dart';
import 'widght_demo.dart';
import 'widget_material.dart';
import 'gesture_demo.dart';
import 'stateful_demo.dart';
import 'shopping_cart.dart';

final _biggerFont = const TextStyle(fontSize: 18.0);

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter练习"),
      ),
      body: _buildHomeListView(),
    );
  }

  Widget _buildHomeListView() {
    final _pages = <String>[];
    _pages.add("ListView");
    _pages.add("Widget");
    _pages.add("MaterialWidget");
    _pages.add("Gesture");
    _pages.add("Stateful");
    _pages.add("ShoppingCart");

    final _tiles = _pages.map((page) {
      return new ListTile(
        title: new Text(
          page,
          style: _biggerFont,
        ),
        onTap: () {
          _pushHomeRouter(page);
        },
      );
    });
    final _divided = ListTile
        .divideTiles(
          context: context,
          tiles: _tiles,
        )
        .toList();
    return new ListView(
      children: _divided,
    );
  }

  void _pushHomeRouter(page) {
    switch (page) {
      case "ListView":
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new RandonWords();
        }));
        break;
      case "Widget":
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new MyScaffold();
        }));
        break;
      case "MaterialWidget":
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new MaterialWidget();
        }));
        break;
      case "Gesture":
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new GestureDemo();
        }));
        break;
      case "Stateful":
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new BasePage(title: "Stateful", body: Counter2());
        }));
        break;
      case "ShoppingCart":
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new BasePage(
              title: "ShoppingCart",
              body: ShoppingList(
                products: <Product>[
                  new Product(name: "猪肉"),
                  new Product(name: "牛肉"),
                  new Product(name: "鸡肉"),
                ],
              ));
        }));
        break;
      default:
    }
  }
}
