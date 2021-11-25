import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Home/Home_UI.dart';
import 'package:ministop/Home/ListCategory/ListCategory.dart';
import 'package:ministop/constants.dart';
import 'package:ministop/provider/category_provider.dart';
import 'package:ministop/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:ministop/Login/Login_UI.dart';
import 'package:ministop/Models/USER.dart';
import 'package:ministop/Models/PRODUCT.dart';
import 'package:ministop/Profile/Profile_UI.dart';
import 'package:ministop/Register/Register_UI.dart';
import 'package:ministop/Welcome/Welcome_UI.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: yellow_ministop,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Home_UI();
            } else {
              return Login_UI();
            }
          },
        ),
      ),
    );
  }
}

