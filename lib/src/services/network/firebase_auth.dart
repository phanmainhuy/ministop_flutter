import 'package:firebase_auth/firebase_auth.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/services/network/fire_store.dart';

class FireBaseAuth {
  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  bool get isLogin => currentUser != null;

  Future<UserCredential> login(
      {required String email, required String password}) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logOut() {
    return _auth.signOut();
  }

  Future<UserCredential> register(
      {required String email,
      required String password,
      required String username,
      required String address,
      required String phoneNumber}) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final _fireStore = locator<FireStore>();
    await _fireStore.saveUserData(
        username: username,
        userId: credential.user!.uid,
        email: email,
        address: address,
        phoneNumber: phoneNumber);
    return credential;
  }

}
