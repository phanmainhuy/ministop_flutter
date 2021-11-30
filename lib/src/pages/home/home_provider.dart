import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool homeColor = true;
  bool checkoutColor = false;
  bool aboutColor = false;
  bool contactUsColor = false;
  bool profileColor = false;

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
    FirebaseAuth.instance.signOut().then((_) {
      notifyListeners();
    });
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
}
