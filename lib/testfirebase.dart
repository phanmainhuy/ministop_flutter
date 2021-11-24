// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   runApp(testFirebase(title: 'Has data',));
//
// }
//
// class testFirebase extends StatefulWidget {
//
//   String title;
//
//   testFirebase({Key? key, required this.title}) : super(key: key);
//
//
//
//   @override
//   _testFirebaseState createState() => _testFirebaseState();
// }
//
// class _testFirebaseState extends State<testFirebase> {
//   final Future<FirebaseApp>_fbApp = Firebase.initializeApp();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//       title: 'demo firebase',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//
//       ),
//
//       home: FutureBuilder(
//         future: _fbApp,
//         builder: (context, snapshot){
//           if(snapshot.hasError){
//             print('Error ${snapshot.error.toString()}');
//           }
//           else if(snapshot.hasData)
//             {
//               // print("have data");
//               return testFirebase(
//                 title: 'Has data',
//               );
//             }
//           else{
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return build(context);
//         },
//
//       ),
//     );
//   }
// }
