import 'package:flutter/material.dart';
import 'package:ministop/src/components/rounded_input_field.dart';
import 'package:ministop/src/components/rounded_password_field.dart';
import 'package:ministop/src/pages/home/home_page.dart';
import 'package:ministop/src/pages/login/login_provider.dart';
import 'package:ministop/src/pages/register/register_page.dart';
import 'package:ministop/src/resources/app_color.dart';
import 'package:ministop/src/resources/app_drawable.dart';
import 'package:ministop/src/utils/validator.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) {
        final provider = LoginProvider();

        provider.onLoginSuccess = () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
            (predicate) => predicate.isFirst,
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
          child: Form(
            key: context.read<LoginProvider>().formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppDrawable.logo(width: size.width * 0.60),
                const SizedBox(height: 10),
                const Text(
                  "CỬA HÀNG TIỆN LỢI\nMINISTOP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColor.blue),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 330,
                  child: RoundedInputField(
                    icon: Icons.person,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    controller: context.read<LoginProvider>().email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phải nhập địa chỉ email';
                      }

                      if (!Validator.email(value)) {
                        return 'Địa chỉ email sai định dạng';
                      }

                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 330,
                  child: MyPasswordField(
                    hintText: 'Mật khẩu',
                    controller: context.read<LoginProvider>().password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phải nhập mật khẩu';
                      }

                      if (value.length < 8) {
                        return 'Mật khẩu phải lớn hơn 8 kí tự';
                      }

                      return null;
                    },
                  ),
                ),
                _buildRememberPassword,
                const SizedBox(height: 10),
                _buildLoginButton,
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
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
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
      ),
    );
  }

  Widget get _buildLoginButton => Selector<LoginProvider, bool>(
        selector: (context, provider) => provider.isLoading,
        builder: (context, isLoading, _) => SizedBox(
          width: 330,
          height: 50,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  child: Text("Đăng nhập".toUpperCase(),
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
                  onPressed: context.read<LoginProvider>().onLogin),
        ),
      );

  Widget get _buildRememberPassword => Selector<LoginProvider, bool>(
        selector: (context, provider) => provider.isSavePassword,
        builder: (context, isSavePassword, _) => SizedBox(
          width: 330,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CheckBoxRemember(
                value: isSavePassword,
                onChanged: context.read<LoginProvider>().savedPassword,
              ),
              const Text('Lưu mật khẩu'),
            ],
          ),
        ),
      );
}

class CheckBoxRemember extends StatelessWidget {
  final ValueChanged<bool>? onChanged;
  final bool value;

  const CheckBoxRemember({Key? key, this.onChanged, this.value = false})
      : super(key: key);

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
      value: value,
      onChanged: (bool? value) {
        onChanged?.call(value ?? false);
      },
    );
  }
}
