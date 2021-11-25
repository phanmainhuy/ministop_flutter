
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:ministop/Models/GLOBAL.dart';

import 'package:ministop/constants.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Login/Login_UI.dart';


class UserModel{
   String id;
   String sdt;
   String hoten;
   String matkhau;
   String email;
   String gioitinh;
   String diachi;
   String hinhanh;
  //Constructor
  UserModel({
    required this.id,
    required this.sdt,
    required this.hoten,
    required this.matkhau,
    required this.email,
    required this.gioitinh,
    required this.diachi,
    required this.hinhanh,});


  //this is a static method
  factory UserModel.fromJson(Map<String, dynamic>json){
    return UserModel(
        id: json['idnguoidung'],
        sdt: json['sdt'],
        hoten: json['hoten'],
        matkhau: json['matkhau'],
        email: json['email'],
        gioitinh: json['gioitinh'],
        diachi: json['diachi'],
        hinhanh: json['hinhanh']
    );
  }
}


// List<User_Model> parseUser(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<User_Model>((json) =>User_Model.fromJson(json)).toList();
// }
// Future<List<User_Model>> getUser() async {
//   final response = await http.get(Uri.parse(apiMinistop + "getnguoidung.php"));
//   if (response.statusCode == 200) {
//     return parseUser(response.body);
//   } else {
//     throw Exception('Unable to fetch products from the REST API');
//   }
// }

// //Fetch data from Restful API
// Future<List<User_Model>> fetch_UsersLogin(http.Client client) async{
//   final response = await client.get(Uri.parse(apiMinistop + "getnguoidung.php"));
//   if(response.statusCode==200){
//     Map<String, dynamic> mapResponse = json.decode(response.body);
//     if(mapResponse['matkhau'] == '123')
//
//       final
//
//
//   }
//
// }







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



