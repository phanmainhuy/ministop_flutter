import 'package:flutter/material.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/models/user_model.dart';
import 'package:ministop/src/services/network/fire_store.dart';

class UserProvider with ChangeNotifier {
  final _fireStore = locator<FireStore>();
  UserModel? userData;

  UserProvider() {
    _fireStore.fetchUserData().then((data) {
      userData = data;
      notifyListeners();
    });
  }
}
