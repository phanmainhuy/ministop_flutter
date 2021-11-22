import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome_UI extends StatefulWidget {
  const Welcome_UI({Key? key}) : super(key: key);

  @override
  _Welcome_UIState createState() => _Welcome_UIState();
}

class _Welcome_UIState extends State<Welcome_UI> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME TO MINISTOP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue),

              ),
              Image.asset("assets/images/logo.png",
                width: size.width * 0.60,

              )

            ],
          ),
        ),
      ),

    );
  }
}
