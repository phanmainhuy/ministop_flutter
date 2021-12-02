import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ministop/src/base/di/locator.dart';
import 'package:ministop/src/models/category_model.dart';
import 'package:ministop/src/models/product_model.dart';
import 'package:ministop/src/models/user_model.dart';
import 'package:ministop/src/services/network/firebase_auth.dart';

class FireStore {
  final _fireStore = FirebaseFirestore.instance;

  Future<void> saveUserData(
      {required String username,
      required String userId,
      required String email,
      required String address,
      required String phoneNumber}) {
    return _fireStore.collection("User").doc(userId).set({
      "UserName": username,
      "UserId": userId,
      "UserEmail": email,
      "UserAddress": address,
      "UserNumber": phoneNumber,
    });
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final snapShotData = await _fireStore.collection('category').get();

    return snapShotData.docs
        .map<CategoryModel>((element) =>
            CategoryModel.fromJson(id: element.id, data: element.data()))
        .toList();
  }

  Future<UserModel> fetchUserData() async {
    final _auth = locator<FireBaseAuth>();

    if (!_auth.isLogin) throw NullThrownError();

    final currentUser = _auth.currentUser;
    QuerySnapshot userSnapShot = await _fireStore.collection("User").get();

    return userSnapShot.docs
        .map(
          (element) {
            if (currentUser!.uid == element["UserId"]) {
              return UserModel(
                  diachi: element["UserAddress"],
                  hinhanh: element["UserImage"],
                  email: element["UserEmail"],
                  hoten: element["UserName"],
                  sdt: element["UserNumber"]);
            }

            return null;
          },
        )
        .whereType<UserModel>()
        .toList()
        .first;
  }

  Future<List<ProductModel>> fetchProducts() async {
    final snapShotData = await _fireStore.collection('product').get();

    return snapShotData.docs
        .map<ProductModel>((element) =>
            ProductModel.fromJson(id: element.id, data: element.data()))
        .toList();
  }
}
