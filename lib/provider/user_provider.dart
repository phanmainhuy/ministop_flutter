import 'package:ministop/Models/USER.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> userModelList = [];
  late UserModel userModel;

  // Future<void> getUserData() async {
  //   List<UserModel> newList = [];
  //   User? currentUser =  FirebaseAuth.instance.currentUser;
  //   QuerySnapshot userSnapShot =
  //   await FirebaseFirestore.instance.collection("User").get();
  //   userSnapShot.docs.forEach(
  //         (element) {
  //       if (currentUser!.uid == element.data()!["UserId"]) {
  //         userModel = userModel(
  //             id: element.data()["UserAddress"],
  //             hinhanh: element.data()["UserImage"],
  //             email: element.data()["UserEmail"],
  //             matkhau: element.data()["UserName"],
  //             sdt: element.data()["UserNumber"]);
  //
  //         newList.add(userModel);
  //       }
  //       userModelList = newList;
  //     },
  //   );
  // }










}