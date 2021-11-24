import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Home/Home_UI.dart';
import 'package:ministop/Home/ListCategory/ListCategory.dart';

import 'package:ministop/Login/Login_UI.dart';
import 'package:ministop/Models/USER.dart';
import 'package:ministop/Models/PRODUCT.dart';
import 'package:ministop/Profile/Profile_UI.dart';
import 'package:ministop/Register/Register_UI.dart';
import 'package:ministop/Welcome/Welcome_UI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login_UI(),

    );
  }
}

