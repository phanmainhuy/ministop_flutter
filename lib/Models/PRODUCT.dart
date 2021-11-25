import 'dart:convert';
import 'dart:async';
import 'GLOBAL.dart';
import 'package:http/http.dart' as http;

class Product_Model{
  final String image;
  final String name;
  final double price;
  //Constructor
  Product_Model({required this.image, required this.name, required this.price});
  //this is a static method



  }

//
// List<Product_Model> parseProduct(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Product_Model>((json) =>Product_Model.fromJson(json)).toList();
// }
// Future<List<Product_Model>> getProducts() async {
//   final response = await http.get(Uri.parse(apiMinistop + "getsanpham.php"));
//   if (response.statusCode == 200) {
//     return parseProduct(response.body);
//   } else {
//     throw Exception('Unable to fetch products from the REST API');
//   }
// }
//
// Future<List<Product_Model>> _getProducts() async {
//     var data = await http.get(Uri.parse(apiMinistop + "getsanpham.php"));
//     var jsondata = json.decode(data.body);
//     List<Product_Model> products = [];
//     for (var p in jsondata){
//       Product_Model product = Product_Model(p[])
//     }
//
// }