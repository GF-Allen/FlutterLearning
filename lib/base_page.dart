import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final title;
  final body;

  BasePage({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
