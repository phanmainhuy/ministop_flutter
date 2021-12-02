import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/models/category_model.dart';
import 'package:ministop/src/services/network/fire_store.dart';

class HomeProvider extends ChangeNotifier {
  final _fireStore = locator<FireStore>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool homeColor = true;
  bool checkoutColor = false;
  bool aboutColor = false;
  bool contactUsColor = false;
  bool profileColor = false;

  VoidCallback? onLogOutSuccess;

  List<CategoryModel> categories = [];

  HomeProvider() {
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      categories = await _fireStore.fetchCategories();
      notifyListeners();
    } catch (_) {}
  }

  void selectHomeTile() {
    homeColor = true;
    contactUsColor = false;
    checkoutColor = false;
    aboutColor = false;
    profileColor = false;
    notifyListeners();
  }

  void selectCheckOutTile() {
    checkoutColor = true;
    contactUsColor = false;
    homeColor = false;
    profileColor = false;
    aboutColor = false;
    notifyListeners();
  }

  void selectProfileTile() {
    aboutColor = false;
    contactUsColor = false;
    homeColor = false;
    profileColor = true;
    checkoutColor = false;
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
    onLogOutSuccess?.call();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
}
