import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/utils/validator.dart';

class RegisterProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  final email = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();

  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  //submit
  FutureOr<void> onSubmit() async {
    final validate = _validateForm();

    if (!validate) return;

    isLoading = true;
    notifyListeners();

    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      print(result);

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
      FirebaseFirestore.instance.collection("User").doc(result.user!.uid).set({
        "UserName": userName.text,
        "UserId": result.user!.uid,
        "UserEmail": email.text,
        "UserAddress": address.text,
        "UserNumber": phoneNumber.text,
      });
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
  }

  // Navigator.of(context)
  //     .pushReplacement(MaterialPageRoute(builder: (ctx) => Home_UI()));
  // setState(() {
  //   isLoading = false;
  // });

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
