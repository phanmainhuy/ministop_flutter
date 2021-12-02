import 'package:flutter/material.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/models/category_model.dart';
import 'package:ministop/src/models/product_model.dart';
import 'package:ministop/src/services/network/fire_store.dart';

class CategoryProvider with ChangeNotifier {
  final _fireStore = locator<FireStore>();

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
    _fetchSandwichData();
    _fetchDessertData();
    _fetchSushiData();

    //get image Category
    _fetchImgSandwichData();
    _fetchImgCateDessertData();
    _fetchImgSushiData();
  }

  //sandwich
  Future<void> _fetchSandwichData() async {
    _sandwich = await _fireStore.fetchSandwichData();
    notifyListeners();
  }

  //get img
  Future<void> _fetchImgSandwichData() async {
    _imgCateSandwich = await _fireStore.fetchImgSandwichData();
    notifyListeners();
  }

  //sushi
  Future<void> _fetchSushiData() async {
    _sushi = await _fireStore.fetchSushiData();
    notifyListeners();
  }

  //get img
  Future<void> _fetchImgSushiData() async {
    _imgCateSushi = await _fireStore.fetchImgSushiData();
    notifyListeners();
  }

  //dessert
  Future<void> _fetchDessertData() async {
    _dessert = await _fireStore.fetchDessertData();
    notifyListeners();
  }

  //get img
  Future<void> _fetchImgCateDessertData() async {
    _imgCateDessert = await _fireStore.fetchImgCateDessertData();
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
