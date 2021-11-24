import 'package:flutter/material.dart';
import 'package:ministop/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'ListCategory/ListCategory.dart';


final List<String> imgList = [
  'assets/slide_flutter/1.png',
  'assets/slide_flutter/2.png',
  'assets/slide_flutter/3.png',
  'assets/slide_flutter/4.png',
  'assets/slide_flutter/5.png',
  'assets/slide_flutter/6.png',
  'assets/slide_flutter/7.png',
  'assets/slide_flutter/8.png',
  'assets/slide_flutter/9.png',
  'assets/slide_flutter/10.png',
];

class Home_UI extends StatefulWidget {
  const Home_UI({Key? key}) : super(key: key);

  @override
  _Home_UIState createState() => _Home_UIState();
}


class _Home_UIState extends State<Home_UI> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellow_ministop,
        title: Container(
          height: 50,
          child: Row(
            children: [
              Image.asset("assets/images/logo.png",
                width: 60,
                height: 100,
              ),
              Text(
                " Deliciously - Friendly - Conveniently",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5, color: blue_ministopColor),
              ),




            ],
          ),

        ),
        iconTheme: IconThemeData(color: blue_ministopColor),
        actions: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {

          },
          )
        ],
      ),

      body: Container(

          child: Column(
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                ),
                items: imageSliders,
              ),

              SizedBox(height: 20,),
              SizedBox(
                child: Row(
                  children: <Widget>[
                    //add button
                    SizedBox(width: 10,),
                    //add button timkiem
                    SizedBox(
                      child :ElevatedButton(
                        child: Text(
                            "Tìm kiếm",
                            style: TextStyle(fontSize: 15)
                        ),

                        style: ButtonStyle(

                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(blue_ministopColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.white)
                                )
                            )
                        ),
                        onPressed:() => null,
                      ),
                    ),

//add button
                    SizedBox(width: 10,),
                    //add button timkiem
                    SizedBox(
                      child :ElevatedButton(
                        child: Text(
                            "Sản phẩm",
                            style: TextStyle(fontSize: 15)
                        ),

                        style: ButtonStyle(

                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(blue_ministopColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.white)
                                )
                            )
                        ),
                        onPressed:() => null,
                      ),
                    ),

                //add button
                    SizedBox(width: 10,),
                    //add button timkiem
                    SizedBox(
                      child :ElevatedButton(
                        child: Text(
                            "Thông tin tài khoản",
                            style: TextStyle(fontSize: 15)
                        ),

                        style: ButtonStyle(

                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(blue_ministopColor),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.white)
                                )
                            )
                        ),
                        onPressed:() => null,
                      ),
                    ),


                  ],
                ),
              ),

              SizedBox(height: 10,),
              SizedBox(
                child: Text("Danh mục sản phẩm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: blue_ministopColor),),

              ),
              SizedBox(height: 10,),

            // SingleChildScrollView(
            //       child: ListCategory(),
            // ),
            ],

          ),
        ),

    );

  }
}








final List<Widget> imageSliders = imgList
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                // child: Text(
                //   'No. ${imgList.indexOf(item)} image',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 20.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();