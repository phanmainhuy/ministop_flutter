import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Models/CATEGORY.dart';
import 'package:ministop/Models/PRODUCT.dart';

class CategoryProvider with ChangeNotifier {
  List<Product_Model> sandwich = [];
  late Product_Model sandwichData;
  List<Product_Model> drink = [];
  late Product_Model drinkData;
  List<Product_Model> sushi = [];
  late Product_Model sushiData;

  List<Product_Model> dessert = [];
  late Product_Model dessertData;
  List<Category_Model> imgCateSandwich = [];
  late Category_Model imgCateSandwichData;

//get img
  Future<void> getImgSandwichData() async {
    List<Category_Model> newList = [];
    await Firebase.initializeApp();
    QuerySnapshot sandwichSnapShot = await FirebaseFirestore.instance
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("sandwich")
        .get();
    sandwichSnapShot.docs.forEach(
          (element) {
            imgCateSandwichData = Category_Model(image: element["image"]);
        newList.add(imgCateSandwichData);
      },
    );
    imgCateSandwich = newList;
    notifyListeners();
  }
  List<Category_Model> get getSandwichIconData {
    return imgCateSandwich;
  }

  //get img
  List<Category_Model> imgCateSushi = [];
  late Category_Model imgCateSushiData;
  Future<void> getImgSushiData() async {
    List<Category_Model> newList = [];
    await Firebase.initializeApp();
    QuerySnapshot sandwichSnapShot = await FirebaseFirestore.instance
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("sushi")
        .get();
    sandwichSnapShot.docs.forEach(
          (element) {
            imgCateSushiData = Category_Model(image: element["image"]);
        newList.add(imgCateSushiData);
      },
    );
    imgCateSushi = newList;
    notifyListeners();
  }
  List<Category_Model> get getSushiIconData {
    return imgCateSushi;
  }

  //get img
  List<Category_Model> imgCateDessert = [];
  late Category_Model imgCateDessertData;
  Future<void> getImgCateDessertData() async {
    List<Category_Model> newList = [];
    await Firebase.initializeApp();
    QuerySnapshot sandwichSnapShot = await FirebaseFirestore.instance
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("dessert")
        .get();
    sandwichSnapShot.docs.forEach(
          (element) {
            imgCateDessertData = Category_Model(image: element["image"]);
        newList.add(imgCateDessertData);
      },
    );
    imgCateDessert = newList;
    notifyListeners();
  }
  List<Category_Model> get getDessertIconData {
    return imgCateDessert;
  }

  //sandwich
  Future<void> getSandwichData() async {
    List<Product_Model> newList = [];
    await Firebase.initializeApp();
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("sandwich")
        .get();
    shirtSnapShot.docs.forEach(
          (element) {
        sandwichData = Product_Model(
            image: element["image"],
            name: element["name"],
            price: element["price"]);
        newList.add(sandwichData);
      },
    );
    sandwich = newList;
    notifyListeners();
  }

  List<Product_Model> get getSandwichList {
    return sandwich;
  }

  //sushi
  Future<void> getSushiData() async {
    await Firebase.initializeApp();
    List<Product_Model> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("sushi")
        .get();
    shirtSnapShot.docs.forEach(
          (element) {
        sushiData = Product_Model(
            image: element["image"],
            name: element["name"],
            price: element["price"]);
        newList.add(sushiData);
      },
    );
    sushi = newList;
    notifyListeners();
  }

  List<Product_Model> get getSushiList {
    return sushi;
  }

  //dessert
  Future<void> getDessertData() async {
    List<Product_Model> newList = [];
    await Firebase.initializeApp();
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("dessert")
        .get();
    shirtSnapShot.docs.forEach(
          (element) {
            dessertData = Product_Model(
            image: element["image"],
            name: element["name"],
            price: element["price"]);
        newList.add(dessertData);
      },
    );
    dessert = newList;
    notifyListeners();
  }

  List<Product_Model> get getDessertList {
    return dessert;
  }

  //search
  late List<Product_Model> searchList;
  void getSearchList({required List<Product_Model> list}) {
    searchList = list;
  }

  List<Product_Model> searchCategoryList(String query) {
    List<Product_Model> searchShirt = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchShirt;
  }




}