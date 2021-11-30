import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Models/CATEGORY.dart';
import 'package:ministop/Models/PRODUCT.dart';

class CategoryProvider with ChangeNotifier {
  List<Product_Model> sandwich = [];
  List<Product_Model> drink = [];
  List<Product_Model> sushi = [];

  List<Product_Model> dessert = [];
  List<Category_Model> imgCateSandwich = [];

  CategoryProvider() {
    //get product of list
    _getSandwichData();
    _getDessertData();
    _getSushiData();

    //get image Category
    _getImgSandwichData();
    _getImgCateDessertData();
    _getImgSushiData();
  }

//get img
  Future<void> _getImgSandwichData() async {
    List<Category_Model> newList = [];
    QuerySnapshot sandwichSnapShot = await FirebaseFirestore.instance
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("sandwich")
        .get();
    sandwichSnapShot.docs.forEach(
          (element) {
           final imgCateSandwichData = Category_Model(image: element["image"]);
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

  Future<void> _getImgSushiData() async {
    List<Category_Model> newList = [];
    QuerySnapshot sandwichSnapShot = await FirebaseFirestore.instance
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("sushi")
        .get();
    sandwichSnapShot.docs.forEach(
          (element) {
            final imgCateSushiData = Category_Model(image: element["image"]);
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

  Future<void> _getImgCateDessertData() async {
    List<Category_Model> newList = [];
    QuerySnapshot sandwichSnapShot = await FirebaseFirestore.instance
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("dessert")
        .get();
    sandwichSnapShot.docs.forEach(
          (element) {
            final imgCateDessertData = Category_Model(image: element["image"]);
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
  Future<void> _getSandwichData() async {
    List<Product_Model> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("sandwich")
        .get();
    shirtSnapShot.docs.forEach(
          (element) {
        final sandwichData = Product_Model(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
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
  Future<void> _getSushiData() async {
    List<Product_Model> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("sushi")
        .get();
    shirtSnapShot.docs.forEach(
          (element) {
        final sushiData = Product_Model(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
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
  Future<void> _getDessertData() async {
    List<Product_Model> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("dessert")
        .get();
    shirtSnapShot.docs.forEach(
          (element) {
            final dessertData = Product_Model(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
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