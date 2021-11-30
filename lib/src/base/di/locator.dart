import 'package:get_it/get_it.dart';
import 'package:ministop/src/services/network/fire_store.dart';
import 'package:ministop/src/services/network/firebase_auth.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(FireBaseAuth());
  locator.registerSingleton(FireStore());
}
