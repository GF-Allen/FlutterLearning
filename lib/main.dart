import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home_page.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Welcome to Flutter',
        // home: _buildHomeListView(context),
        home: new HomePage());
  }
}
