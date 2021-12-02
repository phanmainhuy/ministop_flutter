import 'package:flutter/material.dart';
import 'package:ministop/src/resources/app_color.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
        backgroundColor: AppColor.blue,
      ),
      body: _buildCard(),


    );
  }
}

Widget _buildCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
    child: Card(
      elevation: 4.0,
      child: ListTile(
        leading: Image.asset(""),
        title: Text("Name Product"),
        trailing: GestureDetector(
          child: Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
        ),
      ),
    ),
  );
}
