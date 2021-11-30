import 'package:flutter/material.dart';

class AppDrawable {
  static logo({double? width, double? height}) =>
      Image.asset("assets/images/logo.png", width: width, height: height);

  static user({double? width}) => Image.asset(
        "assets/images/nguoidung/Cc.png",
        width: width,
      );

  static const userAssetImage = AssetImage("assets/images/nguoidung/Cc.png");
}
