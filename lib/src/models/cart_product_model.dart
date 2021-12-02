class CartProductModel {
  final String productId;
  final String id;
  final String name;
  final String image;
  final double? price;
  final String userId;

  CartProductModel({
    required this.productId,
    this.price,
    required this.id,
    required this.name,
    required this.image,
    required this.userId,
  });

  factory CartProductModel.fromJson(
      {required String id, required Map<String, dynamic> data}) {
    return CartProductModel(
        name: data['name'],
        id: id,
        image: data['image'],
        productId: data['product_id'],
        price: double.tryParse(data['price']),
        userId: data['user_id']);
  }
}
