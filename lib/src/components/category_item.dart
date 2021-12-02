import 'package:flutter/material.dart';
import 'package:ministop/src/models/category_model.dart';
import 'package:ministop/src/utils/extension_string.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel data;

  const CategoryItem({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: data.color.color,
      child: Image(
        width: 100,
        height: 100,
        image: NetworkImage(data.image),
      ),
    );
  }
}
