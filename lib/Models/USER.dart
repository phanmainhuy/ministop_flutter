
import 'dart:convert';
import 'dart:async';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:ministop/Models/GLOBAL.dart';
import 'package:ministop/constants.dart';
import 'package:flutter/material.dart';



class User_Model{
   String id;
   String sdt;
   String hoten;
   String matkhau;
   String email;
   String ngaysinh;
   String gioitinh;
   String diachi;
   String hinhanh;
  //Constructor
  User_Model({required this.id, required this.sdt, required this.hoten, required this.matkhau, required this.email, required this.ngaysinh, required this.gioitinh, required this.diachi, required this.hinhanh,});

  //this is a static method
  factory User_Model.fromJson(Map<String, dynamic>json){
    return User_Model(
        id: json['idnguoidung'],
        sdt: json['sdt'],
        hoten: json['hoten'],
        matkhau: json['matkhau'],
        email: json['email'],
        ngaysinh: json['ngaysinh'],
        gioitinh: json['gioitinh'],
        diachi: json['diachi'],
        hinhanh: json['hinhanh']
    );
  }
}

//Fetch data from Restful API
Future<List<User_Model>> fetch_Users(http.Client client) async{
  final response = await client.get(Uri.parse(apiMinistop + "getnguoidung.php"));
  return fetch_Users(client);

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



