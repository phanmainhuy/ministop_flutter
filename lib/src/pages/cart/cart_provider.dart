import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ministop/src/application.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/models/cart_product_model.dart';
import 'package:ministop/src/services/network/fire_store.dart';

class CartProvider extends ChangeNotifier {
  final _fireStore = locator<FireStore>();
  List<CartProductModel> products = [];
  VoidCallback? onPaymentSuccess;
  bool isPaying = false;

  int get count => products.length;

  int get totalPrice {
    if (products.isEmpty) return 0;

    return products
        .map((e) => e.price ?? 0)
        .reduce((value, element) => value + element);
  }

  CartProvider() {
    _fetchCart();
  }

  Future<void> _fetchCart() async {
    products = await _fireStore.fetchCart();
    notifyListeners();
  }

  void removeCart(int index) {
    final removeItem = products.removeAt(index);
    notifyListeners();
    _fireStore.removeCart(removeItem);
  }

  FutureOr<void> payment() async {
    if (products.isEmpty) return;

    isPaying = true;
    notifyListeners();

    try {
      await _fireStore.removeCarts(products.map((e) => e.id).toList());
      products.clear();
      notifyListeners();

      ScaffoldMessenger.of(MyApp.context).showSnackBar(const SnackBar(
        content: Text('Đã thanh toán thành công'),
        duration: Duration(milliseconds: 600),
      ));

      isPaying = false;
      notifyListeners();
      onPaymentSuccess?.call();
    } catch (_) {
      isPaying = false;
      notifyListeners();

      ScaffoldMessenger.of(MyApp.context).showSnackBar(const SnackBar(
        content: Text('Thánh toán thất bại'),
        duration: Duration(milliseconds: 600),
      ));
    }
  }
}
