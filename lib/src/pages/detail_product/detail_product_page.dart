import 'package:flutter/material.dart';
import 'package:ministop/src/resources/app_color.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
        backgroundColor: AppColor.blue_ministopColor,
      ),
    );
  }
}
