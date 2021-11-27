import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Cart/Cart_UI.dart';
import 'package:ministop/Login/Login_UI.dart';
import 'package:ministop/Models/CATEGORY.dart';
import 'package:ministop/Models/PRODUCT.dart';
import 'package:ministop/Models/USER.dart';
import 'package:ministop/Profile/Profile_UI.dart';
import 'package:ministop/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ministop/provider/category_provider.dart';
import 'package:ministop/provider/product_provider.dart';
import 'package:ministop/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'ListCategory/ListCategory.dart';
import 'ListCategory/ListProduct.dart';


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
late CategoryProvider categoryProvider;
late ProductProvider productProvider;

class _Home_UIState extends State<Home_UI> {

  late double height, width;
  bool homeColor = true;

  bool checkoutColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;
  bool profileColor = false;
  late MediaQueryData mediaQuery;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        actions: [IconButton(icon: Icon(Icons.shopping_cart),
          onPressed:() => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Cart_UI();
                },
              ),
            )
          },
          )
        ],
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
                  items: imageSliders,
                ),
                SizedBox(height: 10,),
                Text("Danh mục sản phẩm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: blue_ministopColor),),
                SizedBox(height: 10,),
              //danh muc sp
                _buildCategory(),

                Text("Sản phẩm khác", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: blue_ministopColor),),

              ],
            ),
          ),
      ),

    );
  }//build

  Widget _buildSandwichIcon() {
    List<Category_Model> sandwichIcon = CategoryProvider().getSandwichIconData;
    List<Product_Model> sandwich = CategoryProvider().getSandwichList;
    return Row(
        children: sandwichIcon.map((e) {
          return GestureDetector(
              onTap: () {},
            // {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (ctx) =>Login_UI(),
            //       //     ListProduct(
            //       //   name: "Sandwich",
            //       //   snapShot: sandwich,
            //       //   isCategory: true,
            //       // ),
            //     ),
            //   );
            // },
            child: _buildCategoryProduct(image: e.image, color: 0xff33dcfd),
          );
        }).toList());
  }

  Widget _buildSushiIcon() {
    List<Category_Model> sushiIcon = CategoryProvider().getSushiIconData;
    List<Product_Model> sushi = CategoryProvider().getSushiList;
    return Row(
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
            child: _buildCategoryProduct(image: e.image, color: 0xff33dcfd),
          );
        }).toList());
  }

  Widget _buildDessertIcon() {
    List<Category_Model> dessertIcon = CategoryProvider().getDessertIconData;
    List<Product_Model> dessert = CategoryProvider().getDessertList;
    return Row(
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
            child: _buildCategoryProduct(image: e.image, color: 0xff33dcfd),
          );
        }).toList());
  }

  //category
  Widget _buildCategoryProduct({required String image, required int color}) {
    return CircleAvatar(
      maxRadius: 15* 0.1 / 2.1,
      backgroundColor: Color(color),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: NetworkImage(image),
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return
        Container(
          height: 80,
          child: Row(
            children: <Widget>[
              _buildDessertIcon(),
              _buildSandwichIcon(),
              _buildSushiIcon(),
            ],
          ),
        );
  }

  //useracount drawer
  Widget _buildUserAccountsDrawerHeader() {
    List<UserModel> userModel = UserProvider().userModelList;
    return Column(
        children: userModel.map((e) {
          return UserAccountsDrawerHeader(
            accountName: Text(
              e.email,
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("images/nguoidung/Cc.png"),
            ),
            decoration: BoxDecoration(color: Color(0xfff2f2f2)),
            accountEmail: Text(e.email, style: TextStyle(color: Colors.black)),
          );
        }).toList());
  }

  //drawable
  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _buildUserAccountsDrawerHeader(),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                contactUsColor = false;
                checkoutColor = false;
                aboutColor = false;
                profileColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: checkoutColor,
            onTap: () {
              setState(() {
                checkoutColor = true;
                contactUsColor = false;
                homeColor = false;
                profileColor = false;
                aboutColor = false;
              });
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => Cart_UI()));
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),

          ListTile(
            selected: profileColor,
            onTap: () {
              setState(() {
                aboutColor = false;
                contactUsColor = false;
                homeColor = false;
                profileColor = true;
                checkoutColor = false;
              });
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => Profile_UI(),
                ),
              );
            },
            leading: Icon(Icons.info),
            title: Text("Profile"),
          ),
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
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  void getCallAllFunction() {
    //get product of list
    categoryProvider.getSandwichData();
    categoryProvider.getDessertData();
    categoryProvider.getSushiData();

    //get image Category
    categoryProvider.getImgSandwichData();
    categoryProvider.getImgCateDessertData();
    categoryProvider.getImgSushiData();
    // categoryProvider.getDressIconData();
    // productProvider.getNewAchiveData();
    // productProvider.getFeatureData();
    // productProvider.getHomeFeatureData();
    // productProvider.getHomeAchiveData();

    // categoryProvider.getPantIconData();
    // categoryProvider.getTieIconData();
    // productProvider.getUserData();
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