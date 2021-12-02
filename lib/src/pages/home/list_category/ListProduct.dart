import 'package:flutter/material.dart';
import 'package:ministop/src/models/product_model.dart';
import 'package:ministop/src/pages/home/home_page.dart';

import 'SingleProduct.dart';

class ListProduct extends StatelessWidget {
  final String name;
  bool isCategory = true;
  final List<ProductModel> snapShot;

  ListProduct({
    required this.name,
    required this.isCategory,
    required this.snapShot,
  });

  //build Ten
  Widget _buildTopName() {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMyGridView(context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Container(
      height: 700,
      child: GridView.count(
        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        childAspectRatio: orientation == Orientation.portrait ? 0.8 : 0.9,
        scrollDirection: Axis.vertical,
        children: snapShot
            .map(
              (e) => GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //     builder: (ctx) => Detail_UI(
                  //       image: e.image,
                  //       name: e.name,
                  //       price: e.price,
                  //     )));
                },
                child: Container(),
              ),
            )
            .toList(),
      ),
    );
  }

  /*Widget _buildSearchBar(CategoryProvider provider) {
    return isCategory == true
        ? IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              provider.getSearchList(list: snapShot);
              // showSearch(context: context, delegate: provider.SearchCategory());
            },
          )
        : IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              // productProvider.getSearchList(list: snapShot);
              // showSearch(context: context, delegate: SearchProduct());
            },
          );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomePage(),
                ),
              );
            }),
        actions: <Widget>[
          // _buildSearchBar(context),
          // NotificationButton(),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            _buildTopName(),
            SizedBox(
              height: 10,
            ),
            _buildMyGridView(context),
          ],
        ),
      ),
    );
  }
}
