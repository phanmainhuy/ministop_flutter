import 'package:flutter/material.dart';
import 'package:ministop/src/services/network/firebase_auth.dart';

import 'base/di/locator.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'resources/app_color.dart';

class MyApp extends StatelessWidget {
  final _auth = locator<FireBaseAuth>();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: AppColor.yellow_ministop,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        debugShowCheckedModeBanner: false,
        home: _auth.isLogin ? HomePage() : LoginPage());
  }
}
