import 'package:flutter/material.dart';
import 'package:ministop/src/components/rounded_input_field.dart';
import 'package:ministop/src/components/rounded_password_field.dart';
import 'package:ministop/src/pages/login/login_page.dart';
import 'package:ministop/src/resources/app_color.dart';
import 'package:ministop/src/resources/app_drawable.dart';
import 'package:provider/provider.dart';

import 'register_provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterProvider(),
      child: _RegisterPage(),
    );
  }
}

class _RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: context.read<RegisterProvider>().scaffoldKey,
      backgroundColor: AppColor.yellow_ministop,
      body: Form(
        key: context.read<RegisterProvider>().formKey,
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppDrawable.logo(width: size.width * 0.60),
              SizedBox(height: 10),
              Text(
                "ĐĂNG KÝ TÀI KHOẢN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColor.blue_ministopColor),
              ),
              Text(
                "MINISTOP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColor.blue_ministopColor),
              ),
              SizedBox(height: 20),

              //text

              //button
              _buildRegisterForm(context),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildInputRegisterForm(context),
        _buildRegisterButton,
        SizedBox(height: 10),
        _buildCancelButton(context),
      ],
    );
  }

  Widget _buildInputRegisterForm(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 330,
            height: 70,
            child: RoundedInputField(
              icon: Icons.person,
              hintText: "Họ và tên",
              controller: context.read<RegisterProvider>().userName,
            ),
          ),
          SizedBox(
            width: 330,
            height: 70,
            child: RoundedInputField(
              icon: Icons.email,
              hintText: "Email",
              controller: context.read<RegisterProvider>().email,
            ),
          ),
          SizedBox(
            width: 330,
            height: 70,
            child: MyPasswordField(
              hintText: 'Mật khẩu',
              obserText: true,
              controller: context.read<RegisterProvider>().password,
              // onTap: () {
              //   FocusScope.of(context).unfocus();
              //   // setState(() {
              //     obserText = !obserText;
              //
              //   // });
              // },
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
              controller: context.read<RegisterProvider>().phoneNumber,
            ),
          ),
          SizedBox(
            width: 330,
            height: 70,
            child: RoundedInputField(
              icon: Icons.add_location,
              hintText: "Địa chỉ",
              controller: context.read<RegisterProvider>().address,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) => SizedBox(
        width: 330,
        height: 50,
        child: ElevatedButton(
          child: Text("HỦY BỎ".toUpperCase(), style: TextStyle(fontSize: 15)),
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColor.blue_ministopColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19.0),
                      side: BorderSide(color: Colors.white)))),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ),
            );
          },
        ),
      );

  Widget get _buildRegisterButton => Selector<RegisterProvider, bool>(
        selector: (context, provider) => provider.isLoading,
        builder: (context, isLoading, _) => SizedBox(
          width: 330,
          height: 50,
          child: isLoading == false
              ? ElevatedButton(
                  child: Text("Đăng ký tài khoản".toUpperCase(),
                      style: TextStyle(fontSize: 15)),
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
                  onPressed: () {
                    context.read<RegisterProvider>().onSubmit();
                    /*Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );*/
                  },
                )
              : Center(child: CircularProgressIndicator()),
        ),
      );
}
