import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ministop/Login/Login_UI.dart';
import 'package:ministop/components/rounded_input_field.dart';
import 'package:ministop/components/rounded_password_field.dart';
import 'package:ministop/constants.dart';

class Register_UI extends StatefulWidget {
  const Register_UI({Key? key}) : super(key: key);

  @override
  _Register_UIState createState() => _Register_UIState();
}

//khai bao
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
bool isLoading = false;

RegExp regExp = new RegExp(p);
bool obserText = true;
final TextEditingController email = TextEditingController();
final TextEditingController userName = TextEditingController();
final TextEditingController phoneNumber = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController address = TextEditingController();


class _Register_UIState extends State<Register_UI> {


//build
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: yellow_ministop,
      body: Form(
        key: _formkey,
        child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.png",
                    width: size.width * 0.60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ĐĂNG KÝ TÀI KHOẢN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: blue_ministopColor),
                  ),
                  Text(
                    "MINISTOP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: blue_ministopColor),
                  ),
                  SizedBox(height: 20),

                  //text

                  //button
                  _builtButtonRegister(this.context),
                ],
              ),
            )),
      ),
    );
  }


  //submit
  void submit() async {
    UserCredential result;
    try {
      setState(() {
        isLoading = true;
      });

      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      print(result);


      // on PlatformException catch (error) {
      //   var message = "Please Check Your Internet Connection ";
      //   if (error.message != null) {
      //     message = error.message!;
      //   }
      //   _scaffoldKey.currentState!.showSnackBar(SnackBar(
      //     content: Text(message.toString()),
      //     duration: Duration(milliseconds: 600),
      //     backgroundColor: Theme.of(context).primaryColor,
      //   ));
      //   setState(() {
      //     isLoading = false;
      //   });
      // } catch (error) {
      //   setState(() {
      //     isLoading = false;
      //   });
      //   _scaffoldKey.currentState!.showSnackBar(SnackBar(
      //     content: Text(error.toString()),
      //     duration: Duration(milliseconds: 600),
      //     backgroundColor: Theme.of(context).primaryColor,
      //   ));
      //
      //   print(error);
      // }
      FirebaseFirestore.instance.collection("User").doc(result.user!.uid).set({
        "UserName": userName.text,
        "UserId": result.user!.uid,
        "UserEmail": email.text,
        "UserAddress": address.text,
        "UserNumber": phoneNumber.text,
      });

    }
    catch(error){

    };
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (ctx) => Home_UI()));
      // setState(() {
      //   isLoading = false;
      // });

    //validation

    void vaildation() async {
      if (userName.text.isEmpty &&
          email.text.isEmpty &&
          password.text.isEmpty &&
          phoneNumber.text.isEmpty &&
          address.text.isEmpty) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("All Flied Are Empty"),
          ),
        );
      } else if (userName.text.length < 6) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("Name Must Be 6 "),
          ),
        );
      } else if (email.text.isEmpty) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("Email Is Empty"),
          ),
        );
      } else if (!regExp.hasMatch(email.text)) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("Please Try Vaild Email"),
          ),
        );
      } else if (password.text.isEmpty) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("Password Is Empty"),
          ),
        );
      } else if (password.text.length < 8) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("Password  Is Too Short"),
          ),
        );
      } else if (phoneNumber.text.length < 11 || phoneNumber.text.length > 11) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("Phone Number Must Be 11 "),
          ),
        );
      } else if (address.text.isEmpty) {
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text("Adress Is Empty "),
          ),
        );
      } else {
        submit();
      }
    }


    }
  }


  Widget _builtButtonRegister(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTextRegister(context),

        SizedBox(
          width: 330,
          height: 50,
          child: ElevatedButton(
            child: Text("Đăng ký tài khoản".toUpperCase(),
                style: TextStyle(fontSize: 15)),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(15)),
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                MaterialStateProperty.all<Color>(blue_ministopColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.0),
                        side: BorderSide(color: Colors.white)))),
            onPressed: () =>
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
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 330,
          height: 50,
          child: ElevatedButton(
            child: Text("HỦY BỎ".toUpperCase(),
                style: TextStyle(fontSize: 15)),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(15)),
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                MaterialStateProperty.all<Color>(blue_ministopColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19.0),
                        side: BorderSide(color: Colors.white)))),
            onPressed: () =>
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
      ],
    );
  }


  Widget _buildTextRegister(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 330,
            height: 70,
            child: RoundedInputField(
              icon: Icons.person,
              hintText: "Họ và tên",
              controller: userName,
            ),
          ),
          SizedBox(
            width: 330,
            height: 70,
            child: RoundedInputField(
              icon: Icons.email,
              hintText: "Email",
              controller: email,
            ),
          ),
          SizedBox(
            width: 330,
            height: 70,
            child: MyPasswordField(
              hintText: 'Mật khẩu',
              obserText: obserText,
              controller: password,
              onTap: () {
                FocusScope.of(context).unfocus();
                // setState(() {
                  obserText = !obserText;

                // });
              },

            ),
          ),


          // SizedBox(
          //   width: 330,
          //   height: 70,
          //   child: MyPasswordField(
          //     hintText: 'Nhập lại mật khẩu',
          //     onChanged: (value) {},
          //   ),
          // ),
          // SizedBox(height: 10,),
          SizedBox(
            width: 330,
            height: 70,
            child: RoundedInputField(
              icon: Icons.phone,
              hintText: "Số điện thoại",
              controller: phoneNumber,
            ),
          ),
          SizedBox(
            width: 330,
            height: 70,
            child: RoundedInputField(
              icon: Icons.add_location,
              hintText: "Địa chỉ",
              controller: address,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
