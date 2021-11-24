import 'package:flutter/material.dart';
import 'package:ministop/components/text_field_container.dart';
import 'package:ministop/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
  required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
      
        onChanged: onChanged,
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
