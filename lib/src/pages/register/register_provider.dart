import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/application.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/services/network/firebase_auth.dart';

class RegisterProvider extends ChangeNotifier {
  final _auth = locator<FireBaseAuth>();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  final email = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();

  VoidCallback? onRegisterSuccess;

  //submit
  FutureOr<void> onSubmit() async {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    try {
      final _ = await _auth.register(
          email: email.text,
          password: password.text,
          username: userName.text,
          address: address.text,
          phoneNumber: phoneNumber.text);

      isLoading = false;
      notifyListeners();
      onRegisterSuccess?.call();
    } on FirebaseAuthException catch (error) {
      isLoading = false;
      notifyListeners();
      //error firebase
      ScaffoldMessenger.of(MyApp.context).showSnackBar(SnackBar(
        content: Text(error.message ?? ''),
        duration: const Duration(milliseconds: 600),
      ));
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
  }
}
