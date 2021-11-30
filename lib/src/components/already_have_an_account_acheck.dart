import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/resources/app_color.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback? onPressed;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: AppColor.kPrimaryColor),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: AppColor.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Function>('press', onPressed));
  }
}
