import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new RaisedButton(
          onPressed: _increment,
          child: new Text("自增"),
        ),
        new Text("Count:$_count")
      ],
    );
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }
}

//================ 显示和操作分离
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final count;

  @override
  Widget build(BuildContext context) {
    return new Text("Count:$count");
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text("自增"),
      onPressed: onPressed,
    );
  }
}

class Counter2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CounterState2();
  }
}

class _CounterState2 extends State<Counter2> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new CounterDisplay(
          count: _count,
        ),
        new CounterIncrementor(
          onPressed: () {
            setState(() {
              _count++;
            });
          },
        ),
      ],
    );
  }
}
