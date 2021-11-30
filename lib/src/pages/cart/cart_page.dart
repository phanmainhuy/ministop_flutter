import 'package:flutter/material.dart';
import 'package:ministop/src/resources/app_color.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        backgroundColor: AppColor.blue_ministopColor,
      ),
    );
  }
}
