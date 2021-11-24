import 'package:flutter/material.dart';
import 'package:ministop/constants.dart';

class Cart_UI extends StatefulWidget {
  const Cart_UI({Key? key}) : super(key: key);

  @override
  _Cart_UIState createState() => _Cart_UIState();
}

class _Cart_UIState extends State<Cart_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        backgroundColor: blue_ministopColor,
      ),
    );
  }
}
