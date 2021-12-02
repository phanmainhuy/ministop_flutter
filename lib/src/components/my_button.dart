import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String name;

  const MyButton({required this.name, this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
        color: const Color(0xff746bc9),
        onPressed: onPressed,
      ),
    );
  }
}
