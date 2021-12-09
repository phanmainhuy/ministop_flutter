class CategoryModel {
  final String image;
  final String name;
  final String id;
  final String color;

  CategoryModel(
      {required this.image,
      required this.name,
      required this.id,
      required this.color});


  factory CategoryModel.fromJson(
      {required String id, required Map<String, dynamic> data}) {
    return CategoryModel(
        name: data['name'], id: id, image: data['image'], color: data['color']);
  }
}
