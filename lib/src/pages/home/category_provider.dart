import 'package:flutter/material.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/models/category_model.dart';
import 'package:ministop/src/services/network/fire_store.dart';

class CategoryProvider with ChangeNotifier {
  final _fireStore = locator<FireStore>();

  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  CategoryProvider() {
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      _categories = await _fireStore.fetchCategories();
      notifyListeners();
    } catch (_) {}
  }
}
