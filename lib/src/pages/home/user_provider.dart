import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/models/user_model.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> userModelList = [];

  Future<void> getUserData() async {
    List<UserModel> newList = [];
    User? currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("User").get();
    userModelList = userSnapShot.docs
        .map(
          (element) {
            if (currentUser!.uid == element["UserId"]) {
              return UserModel(
                  diachi: element["UserAddress"],
                  hinhanh: element["UserImage"],
                  email: element["UserEmail"],
                  hoten: element["UserName"],
                  sdt: element["UserNumber"]);
            }

            return null;
          },
        )
        .whereType<UserModel>()
        .toList();
  }
}
