import 'dart:convert';
import 'dart:async';
import 'GLOBAL.dart';
import 'package:http/http.dart' as http;

class Product_Model{
  String id;
  String iddanhmuc;
  String tensp;
  String hinhanh;
  String mota;
  String xuatxu;
  double gia;
  int soluong;
  String tinhtrang;
  //Constructor
  Product_Model({required this.id, required this.iddanhmuc, required this.tensp, required this.hinhanh,
    required this.mota, required this.xuatxu, required this.gia, required this.soluong, required this.tinhtrang,});

  //this is a static method
  factory Product_Model.fromJson(Map<String, dynamic>json){
    return Product_Model(
        id: json['idsanpham'],
        iddanhmuc: json['iddanhmucsp'],
        tensp: json['tensanpham'],
        hinhanh: json['hinhanh'],
        mota: json['mota'],
        xuatxu: json['xuatxu'],
        gia: json['gia'],
        soluong: json['soluongton'],
        tinhtrang: json['tinhtrang']
    );
  }
}

List<Product_Model> parseProduct(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product_Model>((json) =>Product_Model.fromJson(json)).toList();
}
Future<List<Product_Model>> getProducts() async {
  final response = await http.get(Uri.parse(apiMinistop + "getsanpham.php"));
  if (response.statusCode == 200) {
    return parseProduct(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
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