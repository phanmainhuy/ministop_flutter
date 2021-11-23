import 'package:ministop/Models/GLOBAL.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Models/PRODUCT.dart';
import 'dart:async';
import 'dart:convert';



class ListProducts_UI extends StatefulWidget {
  const ListProducts_UI({Key? key}) : super(key: key);

  @override
  _ListProducts_UIState createState() => _ListProducts_UIState();
}

class _ListProducts_UIState extends State<ListProducts_UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List Products"),
        ),
    );
  }
}
