import 'package:flutter/material.dart';
import 'package:ministop/src/pages/login/login_page.dart';
import 'package:ministop/src/pages/register/register_page.dart';
import 'package:ministop/src/resources/app_color.dart';
import 'package:ministop/src/resources/app_drawable.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.yellow_ministop,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME TO MINISTOP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColor.blue_ministopColor),
              ),
              AppDrawable.logo(width: size.width * 0.60),
              SizedBox(width: 10, height: 20),
              SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  child: Text("Đăng nhập".toUpperCase(),
                      style: TextStyle(fontSize: 17)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColor.blue_ministopColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19.0),
                              side: BorderSide(color: Colors.white)))),
                  onPressed: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    )
                  },
                ),
              ),
              SizedBox(width: 10, height: 10),
              SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  child: Text("Đăng ký".toUpperCase(),
                      style: TextStyle(fontSize: 17)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19.0),
                              side: BorderSide(
                                  color: AppColor.blue_ministopColor)))),
                  onPressed: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    )
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}