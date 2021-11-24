import 'package:ministop/Models/GLOBAL.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Models/PRODUCT.dart';
import 'dart:async';
import 'dart:convert';
import 'package:ministop/Models/CATEGORY.dart';




class ListCategory extends StatefulWidget {
  const ListCategory({Key? key}) : super(key: key);

  @override
  _ListCategoryState createState() => _ListCategoryState();
}



class _ListCategoryState extends State<ListCategory> {

  // late StreamController _postsController;
  // int count = 1;
  // final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  // Future _getDM = getCategory();
  //
  // loadPosts() async {
  //   _getDM.then((res) async {
  //     _postsController.add(res);
  //     return res;
  //   });
  // }
  //
  // showSnack() {
  //   return scaffoldKey.currentState!.showSnackBar(
  //     SnackBar(
  //       content: Text('New content loaded'),
  //     ),
  //   );
  // }

  Future<Null> _handleRefresh() async {
    Future _getDM = searhGiaSu();
    _getDM.then((value) => {lstdefault = value});
  }


  @override
  void initState() {
    // TODO: implement initState
    Future _getDM = getCategory();
    _getDM.then((value) => {lstdefault = value});
    super.initState();
  }

  List<Category_Model> lstdefault = <Category_Model>[];
  @override
  Widget build(BuildContext context) {

    // Future _getDM = getCategory();
    // _getDM.then((value) => {lstdefault = value});

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
            itemCount:lstdefault.length,
            itemBuilder: (BuildContext context,int index){
              Category_Model cgt = lstdefault[index];
              return ListTile(
                  leading: Icon(Icons.list),
                  trailing: Text("GFG",
                    style: TextStyle(
                        color: Colors.green,fontSize: 15),),
                  title:Text("List item ${cgt.id.toString()}")
              );
            }
        ),
      ),

    );
  }
}




//
// class ListProducts_UI extends StatefulWidget {
//   const ListProducts_UI({Key? key}) : super(key: key);
//
//   @override
//   _ListProducts_UIState createState() => _ListProducts_UIState();
// }
//
// class _ListProducts_UIState extends State<ListProducts_UI> {
//   late final List<Product_Model> _lstProduct;
//
//   //
//   // Cart(this._cart);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView.builder(
//             itemCount: _lstProduct.length,
//             itemBuilder: (context, index) {
//               var item = _lstProduct[index];
//               return Padding(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
//                 child: Card(
//                   elevation: 4.0,
//                   child: ListTile(
//                     leading: Icon(
//                       item.icon,
//                       color: item.color,
//                     ),
//                     title: Text(item.name),
//                     trailing: GestureDetector(
//                         child: Icon(
//                           Icons.remove_circle,
//                           color: Colors.red,
//                         ),
//                         onTap: () {
//                           setState(() {
//
//                           });
//                         }),
//                   ),
//
//                 ),
//
//               );
//
//             }),,
//
//     );
//   }
// }
