import 'package:flutter/material.dart';
import 'package:ministop/constants.dart';

class Home_UI extends StatefulWidget {
  const Home_UI({Key? key}) : super(key: key);

  @override
  _Home_UIState createState() => _Home_UIState();
}

class _Home_UIState extends State<Home_UI> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow_ministop,
        title: Container(
          height: 50,
          child: Row(
            children: [
              Image.asset("assets/images/logo.png",
                width: size.width * 0.22,
              ),
              Text(
                "Deliciously - Friendly - Conveniently",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: blue_ministopColor),
              ),

            ],
          ),

        ),
        iconTheme: IconThemeData(color: blue_ministopColor),
        actions: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {

          },
          )
        ],

      ),

    );
  }
}
