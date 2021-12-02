import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/components/my_button.dart';
import 'package:ministop/src/pages/home/home_page.dart';
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
        body: Column(
          children: [
            Expanded(
              child: _buildCard(),
            ),
            _buildButton(),
          ],
        ));
  }
}

Widget _buildCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
    child: Card(
      elevation: 4.0,
      child: ListView(
        children: [
          ListTile(
            leading: Image.asset("assets/images/danhmuc/dessert.png"),
            title: Text("Name Product"),
            subtitle: Text("Price"),
            trailing: GestureDetector(
              child: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Image.asset("assets/images/danhmuc/fast_food.png"),
            title: Text("Name Product"),
            subtitle: Text("Price"),
            trailing: GestureDetector(
              child: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Image.asset("assets/images/danhmuc/ice_cream.png"),
            title: Text("Name Product"),
            subtitle: Text("Price"),
            trailing: GestureDetector(
              child: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Image.asset("assets/images/danhmuc/noodle.png"),
            title: Text("Name Product"),
            subtitle: Text("Price"),
            trailing: GestureDetector(
              child: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Image.asset("assets/images/danhmuc/oden.png"),
            title: Text("Name Product"),
            subtitle: Text("Price"),
            trailing: GestureDetector(
              child: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
          ),

        ],
      ),
    ),
  );
}

Widget _buildButton() {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "Total",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),

        ],
      ),
      SizedBox(
        height: 10,
      ),
      MyButton(
        name: "Thanh toán",
        onPressed: () => {},
      ),
      SizedBox(
        height: 10,
      ),
      MyButton(
        name: "Quay về trang chủ",
        onPressed: () => {},
      ),
    ],
  );
}
