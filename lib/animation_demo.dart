import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AnimationDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new AnimationDemoWidget();
  }
}

class AnimationDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimationDemoState();
  }
}

class _AnimationDemoState extends State<AnimationDemoWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  ListMode<int> _list;
  int _selectedItem;
  int _nextItem;

  @override
  void initState() {
    super.initState();
    _list = new ListMode<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Animation"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _insert,
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: _remove,
          ),
        ],
      ),
      body: new AnimatedList(
        key: _listKey,
        initialItemCount: _list.length,
        itemBuilder: _buildItem,
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return new CardItem(
      item: _list[index],
      selected: _selectedItem == _list[index],
      animation: animation,
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: item,
      selected: false,
    );
  }

  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }
}

class ListMode<E> {
  ListMode({
    @required this.listKey,
    @required this.removedItemBuilder,
    List<E> initialItems,
  })  : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = new List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;
  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.add(item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removeItem = _items.removeAt(index);
    if (removeItem != null) {
      _animatedList.removeItem(index,
          (BuildContext context, Animation<double> animtion) {
        return removedItemBuilder(removeItem, context, animtion);
      });
    }
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatelessWidget {
  const CardItem(
      {Key key,
      @required this.animation,
      this.onTap,
      @required this.item,
      this.selected: false})
      : assert(animation != null),
        assert(item != null && item >= 0),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return new Padding(
      padding: const EdgeInsets.all(2.0),
      child: new SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 128.0,
            child: new Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child: new Text('Item $item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
