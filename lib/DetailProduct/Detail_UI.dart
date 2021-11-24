import 'package:flutter/material.dart';
import 'package:ministop/constants.dart';

class Detail_UI extends StatelessWidget {
  const Detail_UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
        backgroundColor: blue_ministopColor,
      ),
    );
  }
}
