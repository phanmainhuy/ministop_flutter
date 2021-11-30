import 'package:flutter/material.dart';
import 'package:ministop/src/resources/app_color.dart';

import 'text_field_container.dart';

class MyPasswordField extends StatelessWidget {
  // final ValueChanged<String> onChanged;
  final bool obserText;
  final TextEditingController controller;
  final String hintText;

  // final Function onTap;

  const MyPasswordField({
    Key? key,
    required this.hintText,
    required this.obserText,
    required this.controller,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: obserText,
        controller: controller,
        cursorColor: AppColor.blue,
        decoration: InputDecoration(
          hintText: hintText,
          icon: const Icon(
            Icons.lock,
            color: AppColor.blue,
          ),
          suffixIcon: GestureDetector(
            // onTap: onTap(),
            child: Icon(
              obserText == true ? Icons.visibility : Icons.visibility_off,
              color: AppColor.blue,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
