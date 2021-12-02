import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/application.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/services/local/shared_prefs.dart';
import 'package:ministop/src/services/network/firebase_auth.dart';

class LoginProvider extends ChangeNotifier {
  final _prefs = locator<SharedPrefs>();
  final _auth = locator<FireBaseAuth>();
  final email = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  bool isSavePassword = false;
  VoidCallback? onLoginSuccess;

  LoginProvider() {
    final passwordSaved = _prefs.passwordSaved;

    if (passwordSaved != null) {
      email.text = _prefs.emailSaved ?? '';
      password.text = passwordSaved;
      isSavePassword = true;
    }
  }

  FutureOr<void> onLogin() async {
    if (formKey.currentState == null) return;
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    try {
      final _ = await _auth.login(email: email.text, password: password.text);
      isLoading = false;
      notifyListeners();

      if (isSavePassword) {
        _prefs.emailSaved = email.text;
        _prefs.passwordSaved = password.text;
      } else {
        _prefs.removeSaved();
      }

      onLoginSuccess?.call();
    } on FirebaseAuthException catch (error) {
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(MyApp.context).showSnackBar(SnackBar(
        content: Text(error.message ?? ''),
        duration: const Duration(milliseconds: 600),
      ));
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
  }

  void savedPassword(bool value) {
    isSavePassword = value;
    notifyListeners();
  }
}
