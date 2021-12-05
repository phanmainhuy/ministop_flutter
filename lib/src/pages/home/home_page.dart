import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/components/category_item.dart';
import 'package:ministop/src/components/home_product_item.dart';
import 'package:ministop/src/models/category_model.dart';
import 'package:ministop/src/models/product_model.dart';
import 'package:ministop/src/models/user_model.dart';
import 'package:ministop/src/pages/cart/cart_page.dart';
import 'package:ministop/src/pages/login/login_page.dart';
import 'package:ministop/src/pages/profile/profile_page.dart';
import 'package:ministop/src/resources/app_color.dart';
import 'package:ministop/src/resources/app_drawable.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';
import 'user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<UserProvider>(
        create: (context) => UserProvider(),
      ),
      ChangeNotifierProvider<HomeProvider>(
        create: (context) {
          final provider = HomeProvider();

          provider.onLogOutSuccess = () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ), (predicate) => predicate.isFirst);
          };

          return provider;
        },
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
    return Scaffold(
      key: context.read<HomeProvider>().scaffoldKey,
      drawer: _buildMyDrawer(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.yellow,
        title: SizedBox(
          height: 50,
          child: Row(
            children: [
              AppDrawable.logo(width: 60, height: 100),
              const Expanded(
                  child: Text(
                " Deliciously - Friendly - Conveniently",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5,
                    overflow: TextOverflow.ellipsis,
                    color: AppColor.blue),
              )),
            ],
          ),
        ),
        iconTheme: const IconThemeData(color: AppColor.blue),
        actions: [_buildCartIcon],
        // leading: IconButton(
        //   icon: const Icon(Icons.article),
        //   onPressed: context.read<HomeProvider>().openDrawer,
        // ),
      ),
      body: Column(
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
          const SizedBox(height: 10),
          const Text(
            "Danh mục sản phẩm",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.blue),
          ),
          _buildCategories,
          const Text(
            "Sản phẩm khác",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.blue),
          ),
          Expanded(child: _buildProducts),
        ],
      ),
    );
  } //build

  Widget get _buildCartIcon => Selector<HomeProvider, int>(
        selector: (context, provider) => provider.countCart,
        builder: (context, count, _) => IconButton(
          icon: Stack(
            children: [
              const Padding(
                  padding: EdgeInsets.all(5), child: Icon(Icons.shopping_cart)),
              Visibility(
                child: Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      child: Text(
                        count.toString(),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )),
                visible: count > 0,
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartPage()),
            ).then((_) {
              context.read<HomeProvider>().refreshCart();
            });
          },
        ),
      );

  Widget get _buildCategories => Selector<HomeProvider, List<CategoryModel>>(
      shouldRebuild: (v1, v2) => true,
      selector: (context, provider) => provider.categories,
      builder: (context, categories, child) {
        return SizedBox(
          height: 90,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, index) => const SizedBox(width: 20),
            itemCount: categories.length,
            itemBuilder: (_, index) => CategoryItem(data: categories[index]),
          ),
        );
      });

  Widget get _buildProducts => Selector<HomeProvider, List<ProductModel>>(
        shouldRebuild: (v1, v2) => true,
        selector: (context, provider) => provider.products,
        builder: (context, products, _) => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (_, index) => HomeProductItem(
                data: products[index],
                onAddCart: () {
                  context.read<HomeProvider>().addProduct(products[index]);
                }),
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            itemCount: products.length),
      );

  //useracount drawer
  Widget get _buildUserAccountsDrawerHeader =>
      Selector<UserProvider, UserModel?>(
        selector: (context, provider) => provider.userData,
        builder: (context, userData, _) {
          return UserAccountsDrawerHeader(
            accountName: Text(
              userData?.hoten ?? '',
              style: const TextStyle(color: Colors.black),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AppDrawable.userAssetImage,
            ),
            decoration: const BoxDecoration(color: Color(0xfff2f2f2)),
            accountEmail: Text(userData?.email ?? '',
                style: const TextStyle(color: Colors.black)),
          );
        },
      );

  //drawable
  Widget _buildMyDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _buildUserAccountsDrawerHeader,
          _buildHomeTitle,
          _buildCheckOutTile,
          _buildProfileTile,
          ListTile(
            onTap: context.read<HomeProvider>().logOut,
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget get _buildHomeTitle => Selector<HomeProvider, bool>(
        selector: (context, provider) => provider.homeColor,
        builder: (context, homeColor, _) => ListTile(
          selected: homeColor,
          onTap: context.read<HomeProvider>().selectHomeTile,
          leading: const Icon(Icons.home),
          title: const Text("Home"),
        ),
      );

  Widget get _buildCheckOutTile => Selector<HomeProvider, bool>(
        selector: (context, provider) => provider.checkoutColor,
        builder: (context, checkoutColor, _) => ListTile(
          selected: checkoutColor,
          onTap: () {
            context.read<HomeProvider>().selectCheckOutTile();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const CartPage()))
                .then((_) {
              context.read<HomeProvider>().refreshCart();
            });
          },
          leading: const Icon(Icons.shopping_cart),
          title: const Text("Cart"),
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
                builder: (ctx) => const ProfilePage(),
              ),
            );
          },
          leading: const Icon(Icons.info),
          title: const Text("Profile"),
        ),
      );

  List<Widget> get _buildImageSliders => imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ))
      .toList();
}
