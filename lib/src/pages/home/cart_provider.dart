import 'package:flutter/material.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/models/cart_product_model.dart';
import 'package:ministop/src/models/product_model.dart';
import 'package:ministop/src/services/network/fire_store.dart';

class CartProvider extends ChangeNotifier {
  final _fireStore = locator<FireStore>();
  List<CartProductModel> products = [];

  int get count => products.length;

  CartProvider() {
    _fetchCart();
  }

  Future<void> _fetchCart() async {
    products = await _fireStore.fetchCart();
    notifyListeners();
  }

  void addProduct(ProductModel product) {
    final cartItem = product.toCart;
    products.add(cartItem);
    notifyListeners();

    _fireStore.addCart(cartItem);
  }
}
