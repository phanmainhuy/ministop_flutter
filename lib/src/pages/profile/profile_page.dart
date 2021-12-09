import 'package:flutter/material.dart';
import 'package:ministop/src/components/my_button.dart';
import 'package:ministop/src/resources/app_color.dart';
import 'package:ministop/src/resources/app_drawable.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin người dùng'),
        backgroundColor: AppColor.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              AppDrawable.user(width: size.width * 0.35),

              const SizedBox(height: 20),
              const Text(
                'Phan Mai Như Ý',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 70),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const[
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 230,
                          height: 50,
                          child: Text(
                            'Phan Mai Như Ý',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const[
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 230,
                          height: 50,
                          child: Text(
                            'phanmainhuy@gmail.com',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const[
                        SizedBox(
                          width: 60,
                          height: 50,
                          child: Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 230,
                          height: 50,
                          child: Text(
                            '0948462040',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const[
                        SizedBox(
                          width: 75,
                          height: 50,
                          child: Text(
                            'Address',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 230,
                          height: 50,
                          child: Text(
                            'Tân Bình',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30,),

                    MyButton(
                      name: "Sửa thông tin",
                      onPressed: () {},
                    ),
                  ],
                ),


                // const Text(
                //   'Test',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                //build profile

              ),



            ],
          ),
        ),
      ),
    );
  }
}
