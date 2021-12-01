import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ministop/src/services/local/shared_prefs.dart';
import 'package:provider/provider.dart';

import 'src/application.dart';
import 'src/base/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  await Firebase.initializeApp();
  setupLocator();
  await locator<SharedPrefs>().setup();
  runApp(MyApp());
}
