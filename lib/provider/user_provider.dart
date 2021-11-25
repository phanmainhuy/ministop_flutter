import 'package:ministop/Models/USER.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> userModelList = [];
  late UserModel userModel;

  Future<void> getUserData() async {
    List<UserModel> newList = [];
    User? currentUser =  FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapShot =
    await FirebaseFirestore.instance.collection("User").get();
    userSnapShot.docs.forEach(
          (element) {
        if (currentUser!.uid == element["UserId"]) {
          userModel = UserModel(
              diachi: element["UserAddress"],
              hinhanh: element["UserImage"],
              email: element["UserEmail"],
              hoten: element["UserName"],
              sdt: element["UserNumber"]);

          newList.add(userModel);
        }
        userModelList = newList;
      },
    );
  }










}