import 'package:flutter/material.dart';
import 'package:ministop/src/resources/app_color.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  // final Function validator;
  final IconData icon;

  // final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        // validator: validator(),

        cursorColor: AppColor.blue,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColor.blue,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
