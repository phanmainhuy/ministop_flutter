import 'package:flutter/material.dart';
import 'package:ministop/components/text_field_container.dart';
import 'package:ministop/constants.dart';

class MyPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  const MyPasswordField({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: blue_ministopColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: blue_ministopColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: blue_ministopColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
