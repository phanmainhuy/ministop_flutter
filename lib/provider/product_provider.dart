import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Models/PRODUCT.dart';
import 'package:ministop/Models/CART.dart';

class ProductProvider with ChangeNotifier{
  List<Product_Model> feature = [];

  List<CartModel> checkOutModelList = [];



// san pham dac trung
  Future<void> getFeatureData() async {
    List<Product_Model> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("W2iEoSquw0LcADdfYVq6")
        .collection("featureproduct")
        .get();
    featureSnapShot.docs.forEach(
          (element) {
        final Product_Model featureData = Product_Model(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
        newList.add(featureData);
      },
    );
    feature = newList;
  }

  List<Product_Model> get getFeatureList {
    return feature;
  }

//search
  List<Product_Model> searchList = [];

  List<Product_Model> searchProductList(String query) {
    List<Product_Model> searchFoods = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchFoods;
  }

  void getSearchList({required List<Product_Model> list}) {
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
