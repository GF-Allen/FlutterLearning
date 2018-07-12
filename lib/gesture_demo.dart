import 'package:flutter/material.dart';

class GestureDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("手势处理"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
              "Flutter中的手势系统有两个独立的层。第一层有原始指针(pointer)事件，它描述了屏幕上指针（例如，触摸，鼠标和触控笔）的位置和移动。 第二层有手势，描述由一个或多个指针移动组成的语义动作。"),
          Divider(),
          Text(
            "Pointer",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text('''PointerDownEvent 指针接触到屏幕的特定位置
PointerMoveEvent 指针从屏幕上的一个位置移动到另一个位置
PointerUpEvent 指针停止接触屏幕
PointerCancelEvent 指针的输入事件不再针对此应用（事件取消）'''),
          Divider(),
          Text(
            "手势",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text('''Tap
onTapDown 指针已经在特定位置与屏幕接触
onTapUp 指针停止在特定位置与屏幕接触
onTap tap事件触发
onTapCancel 先前指针触发的onTapDown不会在触发tap事件

双击
onDoubleTap 用户快速连续两次在同一位置轻敲屏幕.

长按
onLongPress 指针在相同位置长时间保持与屏幕接触

垂直拖动
onVerticalDragStart 指针已经与屏幕接触并可能开始垂直移动
onVerticalDragUpdate 指针与屏幕接触并已沿垂直方向移动.
onVerticalDragEnd 先前与屏幕接触并垂直移动的指针不再与屏幕接触，并且在停止接触屏幕时以特定速度移动

水平拖动
onHorizontalDragStart 指针已经接触到屏幕并可能开始水平移动
onHorizontalDragUpdate 指针与屏幕接触并已沿水平方向移动
onHorizontalDragEnd 先前与屏幕接触并水平移动的指针不再与屏幕接触，并在停止接触屏幕时以特定速度移动'''),
          Divider(),
          MyButton(),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print("点击....");
      },
      onHorizontalDragStart: (DragStartDetails event){
        print("event start:"+event.globalPosition.dx.toString());
      },
      onHorizontalDragUpdate: (DragUpdateDetails event){
        print("event update:"+event.delta.dx.toString());
        print("event update:"+event.globalPosition.dx.toString());
      },
      child: new Container(
        height: 66.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text(
            "点击/拖动",
            style: new TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
