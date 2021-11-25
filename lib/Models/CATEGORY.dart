import 'dart:convert';
import 'dart:async';
import 'GLOBAL.dart';
import 'package:http/http.dart' as http;

class Category_Model{

  final String image;
  Category_Model({required this.image});


  }


  //Constructor


  // //this is a static method
  // factory Category_Model.fromJson(Map<String, dynamic>json){
  //   return Category_Model(
  //       id: json['iddanhmuc'],
  //       tendm: json['tendanhmuc'],
  //       hinhanh: json['hinhanh'],
  //   );
  //
  // }






//
// List<Category_Model> parseCategory(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   print(parsed);
//   return parsed.map<Category_Model>((json) =>Category_Model.fromJson(json)).toList();
// }
//
// Future<List<Category_Model>> getCategory() async {
//   final response = await http.get(Uri.parse(apiMinistop + "getdanhmuc.php"),headers: {
//     "Accept": "application/json",
//     "Access-Control_Allow_Origin": "*"
//   });
//   print(response.statusCode);
//   if (response.statusCode == 200) {
//     return parseCategory(response.body);
//   } else {
//     throw Exception('Unable to fetch products from the REST API');
//   }
// }
//
// Future<List<Category_Model>> getDanhMuc() async {
//   return await http
//       .get(
//
//     Uri.parse(apiMinistop + "getdanhmuc.php"),
//   )
//       .then((http.Response response) {
//     final String jsonBody = response.body;
//
//     List<Category_Model> lst = <Category_Model>[];
//
//     final JsonDecoder _decoder = new JsonDecoder();
//     final useListContainer = _decoder.convert(jsonBody);
//     final List userList = useListContainer['data'];
//     lst = parseCategory(response.body);
//     return lst;
//   });
// }