import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/pages/cart/cart_page.dart';
import 'package:ministop/src/pages/home/home_provider.dart';
import 'package:ministop/src/pages/profile/profile_page.dart';
import 'package:ministop/src/resources/app_color.dart';
import 'package:ministop/src/resources/app_drawable.dart';
import 'package:provider/provider.dart';

import 'category_provider.dart';
import 'product_provider.dart';
import 'user_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<CategoryProvider>(
        create: (context) => CategoryProvider(),
      ),
      Provider<ProductProvider>(
        create: (context) => ProductProvider(),
      ),
      Provider<UserProvider>(
        create: (context) => UserProvider(),
      ),
      Provider<HomeProvider>(
        create: (context) => HomeProvider(),
      ),
    ], child: _HomePage());
  }
}

class _HomePage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: context.read<HomeProvider>().scaffoldKey,
      drawer: _buildMyDrawer(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.yellow_ministop,
        title: Container(
          height: 50,
          child: Row(
            children: [
              AppDrawable.logo(width: 60, height: 100),
              Expanded(
                  child: Text(
                " Deliciously - Friendly - Conveniently",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                    overflow: TextOverflow.ellipsis,
                    color: AppColor.blue_ministopColor),
              )),
            ],
          ),
        ),
        iconTheme: IconThemeData(color: AppColor.blue_ministopColor),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CartPage();
                  },
                ),
              )
            },
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.article),
          onPressed: context.read<HomeProvider>().openDrawer,
        ),
      ),
      body: SafeArea(
        child: Container(
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
                items: _buildImageSliders,
              ),
              SizedBox(height: 10),
              Text(
                "Danh mục sản phẩm",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColor.blue_ministopColor),
              ),
              // SizedBox(height: 10,),
              //danh muc sp

              _buildCategory,

              Text(
                "Sản phẩm khác",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColor.blue_ministopColor),
              ),
            ],
          ),
        ),
      ),
    );
  } //build

  Widget _buildSandwichIcon(CategoryProvider provider) {
    final sandwichIcon = provider.imgCateSandwich;
    final sandwich = provider.sandwichList;
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: sandwichIcon.map((e) {
          return GestureDetector(
            onTap: () {
              /*Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => Login_UI(),
                  ListProduct(
                    name: "Sandwich",
                    snapShot: sandwich,
                    isCategory: true,
                  ),
                ),
              );*/
            },
            child: _buildCategoryProduct(image: e.image, color: 0xF09EDE82),
          );
        }).toList());
  }

  Widget _buildSushiIcon(CategoryProvider provider) {
    final sushiIcon = provider.sushiIconData;
    final sushi = provider.sushiList;

    return Row(
        mainAxisSize: MainAxisSize.min,
        children: sushiIcon.map((e) {
          return GestureDetector(
            onTap: () {},
            // {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (ctx) =>Login_UI(),
            //         //   ListProduct(
            //         // name: "sushi",
            //         // snapShot: sushi,
            //         // isCategory: true,
            //       // ),
            //     ),
            //   );
            // },
            child: _buildCategoryProduct(image: e.image, color: 0xF0E87578),
          );
        }).toList());
  }

  Widget _buildDessertIcon(CategoryProvider provider) {
    final dessertIcon = provider.dessertIconData;
    final dessert = provider.dessertList;
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: dessertIcon.map((e) {
          return GestureDetector(
            onTap: () {},
            // {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (ctx) => Login_UI(),
            //       //     ListProduct(
            //       //   name: "dessert",
            //       //   snapShot: dessert,
            //       //   isCategory: true,
            //       // ),
            //
            //     ),
            //   );
            // },
            child: _buildCategoryProduct(image: e.image, color: 0xF083D3E7),
          );
        }).toList());
  }

  //category
  Widget _buildCategoryProduct({required String image, required int color}) {
    return CircleAvatar(
      backgroundColor: Color(color),
      child: Image(
        width: 100,
        height: 100,
        image: NetworkImage(image),
      ),
    );
  }

  Widget get _buildCategory =>
      Consumer<CategoryProvider>(builder: (context, provider, child) {
        return Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              _buildDessertIcon(provider),
              SizedBox(
                width: 20,
              ),
              _buildSandwichIcon(provider),
              SizedBox(
                width: 20,
              ),
              _buildSushiIcon(provider),
            ],
          ),
        );
      });

  //useracount drawer
  Widget _buildUserAccountsDrawerHeader() {
    final userModel = UserProvider().userModelList;
    return Column(
        children: userModel.map((e) {
      return UserAccountsDrawerHeader(
        accountName: Text(
          e.email,
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AppDrawable.userAssetImage,
        ),
        decoration: BoxDecoration(color: Color(0xfff2f2f2)),
        accountEmail: Text(e.email, style: TextStyle(color: Colors.black)),
      );
    }).toList());
  }

  //drawable
  Widget _buildMyDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _buildUserAccountsDrawerHeader(),
          _buildHomeTile,
          _buildCheckOutTile,
          _buildProfileTile,
          //
          // ListTile(
          //   selected: contactUsColor,
          //   onTap: () {
          //     setState(() {
          //       contactUsColor = true;
          //       checkoutColor = false;
          //       profileColor = false;
          //       homeColor = false;
          //       aboutColor = false;
          //     });
          //     Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(builder: (ctx) => ContactUs()));
          //   },
          //   leading: Icon(Icons.phone),
          //   title: Text("Contant Us"),
          // ),
          ListTile(
            onTap: context.read<HomeProvider>().logOut,
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget get _buildHomeTile => Selector<HomeProvider, bool>(
        selector: (context, provider) => provider.homeColor,
        builder: (context, homeColor, _) => ListTile(
          selected: homeColor,
          onTap: context.read<HomeProvider>().selectHomeTile,
          leading: Icon(Icons.home),
          title: Text("Home"),
        ),
      );

  Widget get _buildCheckOutTile => Selector<HomeProvider, bool>(
        selector: (context, provider) => provider.checkoutColor,
        builder: (context, checkoutColor, _) => ListTile(
          selected: checkoutColor,
          onTap: () {
            context.read<HomeProvider>().selectCheckOutTile();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => CartPage()));
          },
          leading: Icon(Icons.shopping_cart),
          title: Text("Cart"),
        ),
      );

  Widget get _buildProfileTile => Selector<HomeProvider, bool>(
        selector: (context, provider) => provider.profileColor,
        builder: (context, profileColor, _) => ListTile(
          selected: profileColor,
          onTap: () {
            context.read<HomeProvider>().selectProfileTile();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ProfilePage(),
              ),
            );
          },
          leading: Icon(Icons.info),
          title: Text("Profile"),
        ),
      );

  void getCallAllFunction() {
    // categoryProvider.getDressIconData();
    // productProvider.getNewAchiveData();
    // productProvider.getFeatureData();
    // productProvider.getHomeFeatureData();
    // productProvider.getHomeAchiveData();

    // categoryProvider.getPantIconData();
    // categoryProvider.getTieIconData();
    // productProvider.getUserData();
  }

  List<Widget> get _buildImageSliders => imgList
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
}
