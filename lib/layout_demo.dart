import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        _imageSection,
        _titleSection,
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //平均分配空间
          children: <Widget>[
            _buildButtonSection(context, "CALL", Icons.call),
            _buildButtonSection(context, "ROUTER", Icons.router),
            _buildButtonSection(context, "SHARE", Icons.share),
          ],
        ),
        _textSection,
      ],
    );
  }

  ///标题栏
  final Widget _titleSection = Container(
    padding: const EdgeInsets.all(32.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //左对齐
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Oeschinen Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(color: Colors.green[500]),
              ),
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red,
        ),
        Text("41"),
      ],
    ),
  );

//构建按钮
  Widget _buildButtonSection(
      BuildContext context, String label, IconData icon) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Icon(
          icon,
          color: color,
        ),
        new Container(
          padding: EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  ///文本内容
  final Widget _textSection = Container(
    padding: EdgeInsets.all(32.0),
    child: new Text(
      "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
      softWrap: true,
    ),
  );

  //头部图片
  final Widget _imageSection = Image.asset(
    "images/landscape_3.jpg", //需要在pubspec.yaml中配置
    height: 240.0,
    fit: BoxFit.cover,
  );
}
