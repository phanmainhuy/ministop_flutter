import 'package:flutter/material.dart';
import 'package:ministop/components/text_field_container.dart';
import 'package:ministop/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
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
