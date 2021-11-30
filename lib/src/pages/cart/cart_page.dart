import 'package:flutter/material.dart';
import 'package:ministop/src/resources/app_color.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
        backgroundColor: AppColor.blue,
      ),
    );
  }
}
