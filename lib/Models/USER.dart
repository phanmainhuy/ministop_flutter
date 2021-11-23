
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:ministop/constants.dart';



class User_Model{
  final String id;
  final String sdt;
  final String hoten;
  final String matkhau;
  final String email;
  final String ngaysinh;
  final String gioitinh;
  final String diachi;
  final String hinhanh;
  //Constructor
  User_Model(this.id, this.sdt, this.hoten, this.matkhau, this.email, this.ngaysinh, this.gioitinh, this.diachi, this.hinhanh);
  


}









  // List<User> parseUser(String responseBody) {
  //   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  //   return parsed.map<User>((json) => User.fromMap(json)).toList();
  // }
  // Future<List<User>> fetchUser() async {
  //
  //   http.Response response = await http.get('http://192.168.1.9/wsministop/getnguoidung.php');
  //   if (response.statusCode == 200) {
  //     return parseUser(response.body);
  //   } else {
  //     throw Exception('Unable to fetch products from the REST API');
  //   }
  // }



