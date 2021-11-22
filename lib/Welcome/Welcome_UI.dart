import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministop/components/rounded_button.dart';

import '../constants.dart';

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
      backgroundColor: yellow_ministop,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME TO MINISTOP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: blue_ministopColor),

              ),
              Image.asset("assets/images/logo.png",
                width: size.width * 0.60,

              ),

              SizedBox(width: 10, height: 20,),
              TextButton(
                  child: Text(
                      "Đăng nhập".toUpperCase(),
                      style: TextStyle(fontSize: 20)
                  ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(blue_ministopColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.0),
                            side: BorderSide(color: blue_ministopColor)
                        )
                    )
                ),
                onPressed:() => null,
              ),
              SizedBox(width: 10, height: 10,),
              TextButton(

                child: Text(
                    "Đăng ký".toUpperCase(),
                    style: TextStyle(fontSize: 20)
                ),
                style: ButtonStyle(
                    
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(blue_ministopColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.0),
                            side: BorderSide(color: blue_ministopColor)
                        )
                    )
                ),
                onPressed:() => null,
              ),






            ],
          ),
        ),
      ),

    );
  }
}
