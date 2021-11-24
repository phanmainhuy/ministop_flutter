
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ministop/Register/Register_UI.dart';
import 'package:ministop/components/rounded_input_field.dart';
import 'package:ministop/components/rounded_password_field.dart';

import '../constants.dart';

class Login_UI extends StatefulWidget {
  const Login_UI({Key? key}) : super(key: key);

  @override
  _Login_UIState createState() => _Login_UIState();
}

class _Login_UIState extends State<Login_UI> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: yellow_ministop,
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[


                Image.asset("assets/images/logo.png",
                  width: size.width * 0.60,

                ),
                SizedBox(height: 10),
                Text(
                  "CỬA HÀNG TIỆN LỢI",
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
                    hintText: "Email",
                    onChanged: (value) {

                    },

                  ),
                ),

                SizedBox(
                  width: 330, height: 70,
                  child:  RoundedPasswordField(
                    hintText: 'Mật khẩu',
                    onChanged: (value) {},
                  ),
                ),
                // SizedBox(height: 10,),
                //add a checkbox save pass
                SizedBox(width: 330, height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CheckBoxRemember(
                          
                    ),
                    Text('Lưu mật khẩu'),
                  ],
                ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  width: 330, height: 50,
                  child: ElevatedButton(
                    child: Text(
                        "Đăng nhập".toUpperCase(),
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
                    onPressed:() => null,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Register_UI();
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
class CheckBoxRemember extends StatefulWidget {
  const CheckBoxRemember({Key? key}) : super(key: key);

  @override
  _CheckBoxRememberState createState() => _CheckBoxRememberState();
}

class _CheckBoxRememberState extends State<CheckBoxRemember> {
  @override
  bool isChecked = false;

  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return blue_ministopColor;
    }
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },

    );
  }
}

