import 'package:flutter/material.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/models/cart_model.dart';
import 'package:ministop/src/models/product_model.dart';
import 'package:ministop/src/services/network/fire_store.dart';

class ProductProvider with ChangeNotifier {
  final _fireStore = locator<FireStore>();

  List<ProductModel> _feature = [];
  List<CartModel> checkOutModelList = [];
  List<ProductModel> searchList = [];

  List<ProductModel> get featureList => _feature;

// san pham dac trung
  Future<void> getFeatureData() async {
    _feature = await _fireStore.fetchFeatureData();
    notifyListeners();
  }

  //search
  List<ProductModel> searchProductList(String query) {
    List<ProductModel> searchFoods = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchFoods;
  }

  void getSearchList({required List<ProductModel> list}) {
    searchList = list;
  }

  //lay data gio hang
  void getCheckOutData({
    required String name,
    required double price,
    required String image,
  }) {
    final checkOutModel = CartModel(
      price: price,
      name: name,
      image: image,
    );
    checkOutModelList.add(checkOutModel);
  }

  List<CartModel> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }

  //xoa product khoi gio hang
  void deleteCheckoutProduct(int index) {
    checkOutModelList.removeAt(index);
    notifyListeners();
  }

  //xoa het gio hang
  void clearCheckoutProduct() {
    checkOutModelList.clear();
    notifyListeners();
  }
}
