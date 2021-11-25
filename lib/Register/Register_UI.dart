import 'package:flutter/material.dart';
import 'package:ministop/Login/Login_UI.dart';
import 'package:ministop/components/rounded_input_field.dart';
import 'package:ministop/components/rounded_password_field.dart';
import 'package:ministop/constants.dart';


class Register_UI extends StatefulWidget {
  const Register_UI({Key? key}) : super(key: key);

  @override
  _Register_UIState createState() => _Register_UIState();
}

class _Register_UIState extends State<Register_UI> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: yellow_ministop,
      body: Form(
        key:_formkey,
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[


                  Image.asset("assets/images/logo.png",
                    width: size.width * 0.60,

                  ),
                  SizedBox(height: 10),
                  Text(
                    "ĐĂNG KÝ TÀI KHOẢN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: blue_ministopColor),
                  ),
                  Text(
                    "MINISTOP",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: blue_ministopColor),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 330, height: 70,
                    child: RoundedInputField(
                      icon: Icons.person,
                      hintText: "Họ và tên",
                      onChanged: (value) {},

                    ),
                  ),
                  SizedBox(
                    width: 330, height: 70,
                    child: RoundedInputField(
                      icon: Icons.email,
                      hintText: "Email",
                      onChanged: (value) {},

                    ),
                  ),
                  SizedBox(
                    width: 330, height: 70,
                    child:  MyPasswordField(
                      hintText: 'Mật khẩu',
                      onChanged: (value) {},
                    ),
                  ),SizedBox(
                    width: 330, height: 70,
                    child:  MyPasswordField(
                      hintText: 'Nhập lại mật khẩu',
                      onChanged: (value) {},
                    ),
                  ),
                  // SizedBox(height: 10,),
                  SizedBox(
                    width: 330, height: 70,
                    child: RoundedInputField(
                      icon: Icons.phone,
                      hintText: "Số điện thoại",
                      onChanged: (value) {},

                    ),
                  ),
                  SizedBox(
                    width: 330, height: 70,
                    child: RoundedInputField(
                      icon: Icons.add_location,
                      hintText: "Địa chỉ",
                      onChanged: (value) {},

                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: 330, height: 50,
                    child: ElevatedButton(
                      child: Text(
                          "Đăng ký tài khoản".toUpperCase(),
                          style: TextStyle(fontSize: 15)
                      ),
                      style: ButtonStyle(

                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(blue_ministopColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.0),
                                  side: BorderSide(color: Colors.white)
                              )
                          )
                      ),
                      onPressed:() =>
                      {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login_UI();
                            },
                          ),
                        )
                      },
                    ),

                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: 330, height: 50,
                    child: ElevatedButton(
                      child: Text(
                          "HỦY BỎ".toUpperCase(),
                          style: TextStyle(fontSize: 15)
                      ),
                      style: ButtonStyle(

                          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(blue_ministopColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.0),
                                  side: BorderSide(color: Colors.white)
                              )
                          )
                      ),

                      onPressed:() => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login_UI();
                            },
                          ),
                        )
                      },

                    ),

                  ),
                ],
              ),
            )

        ),
      ),

    );
  }
}
