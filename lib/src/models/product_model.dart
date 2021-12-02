import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/models/cart_product_model.dart';
import 'package:ministop/src/services/network/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class ProductModel {
  final String image;
  final String name;
  final double? price;
  final String id;
  final String? description;
  final String categoryId;

  ProductModel(
      {required this.image,
      required this.name,
      this.price,
      required this.id,
      required this.categoryId,
      this.description});

  factory ProductModel.fromJson(
      {required String id, required Map<String, dynamic> data}) {
    return ProductModel(
        name: data['name'],
        id: id,
        image: data['image'],
        categoryId: data['category'],
        description: data['descript'],
        price: double.tryParse(data['price']));
  }

  CartProductModel get toCart {
    final auth = locator<FireBaseAuth>();

    return CartProductModel(
        productId: id,
        image: image,
        name: name,
        price: price,
        id: const Uuid().v1().replaceAll('-', ''),
        userId: auth.currentUser!.uid);
  }
}
