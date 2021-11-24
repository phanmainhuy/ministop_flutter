import 'package:flutter/material.dart';
import 'package:ministop/constants.dart';

class Profile_UI extends StatefulWidget {
  const Profile_UI({Key? key}) : super(key: key);

  @override
  _Profile_UIState createState() => _Profile_UIState();
}

class _Profile_UIState extends State<Profile_UI> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin người dùng'),
        backgroundColor: blue_ministopColor,

      ),

      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),

                Image.asset("assets/images/nguoidung/Cc.png",
                  width: size.width * 0.35,


              ),
              SizedBox(height: 10,),

                Text(
                  'Phan Mai Như Ý', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                ),



            ],
          ),
        ),
      ),

    );
  }
}
