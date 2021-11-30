import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/services/network/firebase_auth.dart';
import 'package:ministop/src/utils/validator.dart';

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
    final validate = _validateForm();

    if (!validate) return;

    isLoading = true;
    notifyListeners();

    try {
      final result = await _auth.register(
          email: email.text,
          password: password.text,
          username: userName.text,
          address: address.text,
          phoneNumber: phoneNumber.text);
      print(result);

      isLoading = false;
      notifyListeners();
      onRegisterSuccess?.call();

      // on PlatformException catch (error) {
      //   var message = "Please Check Your Internet Connection ";
      //   if (error.message != null) {
      //     message = error.message!;
      //   }
      //   _scaffoldKey.currentState!.showSnackBar(SnackBar(
      //     content: Text(message.toString()),
      //     duration: Duration(milliseconds: 600),
      //     backgroundColor: Theme.of(context).primaryColor,
      //   ));
      //   setState(() {
      //     isLoading = false;
      //   });
      // } catch (error) {
      //   setState(() {
      //     isLoading = false;
      //   });
      //   _scaffoldKey.currentState!.showSnackBar(SnackBar(
      //     content: Text(error.toString()),
      //     duration: Duration(milliseconds: 600),
      //     backgroundColor: Theme.of(context).primaryColor,
      //   ));
      //
      //   print(error);
      // }
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
  }

  //validation
  bool _validateForm() {
    if (userName.text.isEmpty &&
        email.text.isEmpty &&
        password.text.isEmpty &&
        phoneNumber.text.isEmpty &&
        address.text.isEmpty) {
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("All Flied Are Empty"),
        ),
      );

      return false;
    }

    if (userName.text.length < 6) {
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
        ),
      );
      return false;
    }

    if (email.text.isEmpty) {
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
      return false;
    }

    if (!Validator.email(email.text)) {
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Please Try Vaild Email"),
        ),
      );
      return false;
    }

    if (password.text.isEmpty) {
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
      return false;
    }

    if (password.text.length < 8) {
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Password  Is Too Short"),
        ),
      );
      return false;
    }

    if (phoneNumber.text.length < 11 || phoneNumber.text.length > 11) {
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
      return false;
    }

    if (address.text.isEmpty) {
      scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Adress Is Empty "),
        ),
      );
    }

    return true;
  }
}
