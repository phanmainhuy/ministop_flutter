import 'package:flutter/material.dart';
import 'package:ministop/src/services/network/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'base/di/locator.dart';
import 'pages/cart/cart_provider.dart';
import 'pages/home/home_page.dart';
import 'pages/login/login_page.dart';
import 'resources/app_color.dart';

class MyApp extends StatelessWidget {
  final _auth = locator<FireBaseAuth>();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: AppColor.yellow,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: _auth.isLogin ? const HomePage() : const LoginPage(),
    );
  }
}
