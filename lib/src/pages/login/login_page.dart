import 'package:flutter/material.dart';
import 'package:ministop/src/components/rounded_input_field.dart';
import 'package:ministop/src/components/rounded_password_field.dart';
import 'package:ministop/src/pages/home/home_page.dart';
import 'package:ministop/src/pages/login/login_provider.dart';
import 'package:ministop/src/pages/register/register_page.dart';
import 'package:ministop/src/resources/app_color.dart';
import 'package:ministop/src/resources/app_drawable.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) {
        final provider = LoginProvider();

        provider.onLoginSuccess = () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          );
        };

        return provider;
      },
      child: const _LoginPage(),
    );
  }
}

class _LoginPage extends StatelessWidget {
  const _LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.yellow,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppDrawable.logo(width: size.width * 0.60),
              const SizedBox(height: 10),
              const Text(
                "CỬA HÀNG TIỆN LỢI",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColor.blue),
              ),
              const Text(
                "MINISTOP",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColor.blue),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 330,
                height: 70,
                child: RoundedInputField(
                  icon: Icons.person,
                  hintText: "Email",
                  controller: context.read<LoginProvider>().email,
                ),
              ),

              SizedBox(
                width: 330,
                height: 70,
                child: MyPasswordField(
                  hintText: 'Mật khẩu',

                  controller: context.read<LoginProvider>().password,
                  // onTap: () {
                  //   FocusScope.of(context).unfocus();
                  //   setState(() {
                  //     obserText = !obserText;
                  //   });
                  // },
                ),
              ),
              // SizedBox(height: 10,),
              //add a checkbox save pass
              SizedBox(
                width: 330,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    CheckBoxRemember(),
                    Text('Lưu mật khẩu'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 330,
                height: 50,
                child: ElevatedButton(
                    child: Text("Đăng nhập".toUpperCase(),
                        style: const TextStyle(fontSize: 15)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(15)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColor.blue),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                                side: const BorderSide(color: Colors.white)))),
                    onPressed: context.read<LoginProvider>().onLogin),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 330,
                height: 50,
                child: ElevatedButton(
                  child: Text("Đăng ký tài khoản".toUpperCase(),
                      style: const TextStyle(fontSize: 15)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColor.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19.0),
                              side: const BorderSide(color: Colors.white)))),
                  onPressed: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterPage();
                        },
                      ),
                    ),
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

//check box
class _CheckBoxRememberState extends State<CheckBoxRemember> {
  bool isChecked = false;

  @override
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

      return AppColor.blue;
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
