import 'package:flutter/material.dart';
import 'package:ministop/components/text_field_container.dart';
import 'package:ministop/constants.dart';

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

        cursorColor: blue_ministopColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: blue_ministopColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
