import 'package:flutter/material.dart';
import 'package:ministop/components/text_field_container.dart';
import 'package:ministop/constants.dart';

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


        cursorColor: blue_ministopColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: blue_ministopColor,
          ),
          suffixIcon: GestureDetector(
            // onTap: onTap(),
            child: Icon(
              obserText == true ? Icons.visibility : Icons.visibility_off,
              color: blue_ministopColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
