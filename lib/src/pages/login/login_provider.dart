import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final email = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
