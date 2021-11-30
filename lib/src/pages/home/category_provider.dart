import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/models/category_model.dart';
import 'package:ministop/src/models/product_model.dart';

class CategoryProvider with ChangeNotifier {
  final _fireStore = FirebaseFirestore.instance;
  List<ProductModel> _sandwich = [];
  List<ProductModel> _sushi = [];
  List<ProductModel> _dessert = [];

  List<CategoryModel> _imgCateDessert = [];
  List<CategoryModel> _imgCateSandwich = [];
  List<CategoryModel> _imgCateSushi = [];

  List<ProductModel> get sushiList => _sushi;

  List<ProductModel> get dessertList => _dessert;

  List<CategoryModel> get imgCateSandwich => _imgCateSandwich;

  List<CategoryModel> get sushiIconData => _imgCateSushi;

  List<ProductModel> get sandwichList => _sandwich;

  List<CategoryModel> get dessertIconData => _imgCateDessert;

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
    QuerySnapshot sandwichSnapShot = await _fireStore
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("sandwich")
        .get();

    _imgCateSandwich = sandwichSnapShot.docs.map(
      (element) {
        final imgCateSandwichData = CategoryModel(image: element["image"]);
        return imgCateSandwichData;
      },
    ).toList();
  }

  //get img
  Future<void> _getImgSushiData() async {
    QuerySnapshot sandwichSnapShot = await _fireStore
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("sushi")
        .get();
    _imgCateSushi = sandwichSnapShot.docs.map(
      (element) {
        final imgCateSushiData = CategoryModel(image: element["image"]);
        return imgCateSushiData;
      },
    ).toList();
  }

  //get img
  Future<void> _getImgCateDessertData() async {
    QuerySnapshot sandwichSnapShot = await _fireStore
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("dessert")
        .get();
    _imgCateDessert = sandwichSnapShot.docs.map(
      (element) {
        final imgCateDessertData = CategoryModel(image: element["image"]);
        return imgCateDessertData;
      },
    ).toList();

    notifyListeners();
  }

  //sandwich
  Future<void> _getSandwichData() async {
    QuerySnapshot shirtSnapShot = await _fireStore
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("sandwich")
        .get();
    _sandwich = shirtSnapShot.docs.map(
      (element) {
        final sandwichData = ProductModel(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
        return sandwichData;
      },
    ).toList();
    notifyListeners();
  }

  //sushi
  Future<void> _getSushiData() async {
    QuerySnapshot shirtSnapShot = await _fireStore
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("sushi")
        .get();
    _sushi = shirtSnapShot.docs.map(
      (element) {
        final sushiData = ProductModel(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
        return sushiData;
      },
    ).toList();
    notifyListeners();
  }

  //dessert
  Future<void> _getDessertData() async {
    QuerySnapshot shirtSnapShot = await _fireStore
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("dessert")
        .get();
    _dessert = shirtSnapShot.docs.map(
      (element) {
        final dessertData = ProductModel(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
        return dessertData;
      },
    ).toList();
    notifyListeners();
  }

  //search
  late List<ProductModel> searchList;

  void getSearchList({required List<ProductModel> list}) {
    searchList = list;
  }

  List<ProductModel> searchCategoryList(String query) {
    List<ProductModel> searchSandwich = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();

    return searchSandwich;
  }
}
