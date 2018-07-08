import 'package:flutter/material.dart';

/// 产品实体类
class Product {
  Product({this.name});

  final String name;
}

///添加到购物车回调
typedef void CartChangeCallback(Product product, bool isCart);

///item项
class ShoppingItem extends StatelessWidget {
  final Product product;
  final bool isCard;
  final CartChangeCallback cartChangeCallback;

  ///为Widget添加一个tag，
  ShoppingItem({Product product, this.isCard, this.cartChangeCallback})
      : product = product,
        super(key: new ObjectKey(product));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: () {
        cartChangeCallback(product, !isCard);
      },
      leading: new CircleAvatar(
        child: new Text(product.name[0]),
        backgroundColor: _getColor(context),
      ),
      title: new Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }

  Color _getColor(BuildContext context) {
    return isCard ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!isCard) return null;
    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}

///商品列表
class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    return new _ShoppingListSate();
  }
}

class _ShoppingListSate extends State<ShoppingList> {
  Set<Product> _cart = new Set<Product>();

  void handCartChanged(Product product, bool isCart) {
    setState(() {
      if (isCart) {
        _cart.add(product);
      } else {
        _cart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: widget.products.map((Product product) {
        return new ShoppingItem(
          product: product,
          isCard: _cart.contains(product),
          cartChangeCallback: handCartChanged,
        );
      }).toList(),
    );
  }
}
