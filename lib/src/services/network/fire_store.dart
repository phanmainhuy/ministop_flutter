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

  Future<List<ProductModel>> fetchFeatureData() async {
    QuerySnapshot featureSnapShot = await _fireStore
        .collection("products")
        .doc("W2iEoSquw0LcADdfYVq6")
        .collection("featureproduct")
        .get();

    return featureSnapShot.docs.map(
      (element) {
        final ProductModel featureData = ProductModel(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
        return featureData;
      },
    ).toList();
  }

  Future<List<ProductModel>> fetchSandwichData() async {
    QuerySnapshot shirtSnapShot = await _fireStore
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("sandwich")
        .get();
    return shirtSnapShot.docs.map(
      (element) {
        final sandwichData = ProductModel(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
        return sandwichData;
      },
    ).toList();
  }

  /*Future<List<CategoryModel>> fetchImgSandwichData() async {
    QuerySnapshot sandwichSnapShot = await _fireStore
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("sandwich")
        .get();

    return sandwichSnapShot.docs.map(
      (element) {
        final imgCateSandwichData = CategoryModel(image: element["image"]);
        return imgCateSandwichData;
      },
    ).toList();
  }*/

  //sushi
  Future<List<ProductModel>> fetchSushiData() async {
    QuerySnapshot shirtSnapShot = await _fireStore
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("sushi")
        .get();
    return shirtSnapShot.docs.map(
      (element) {
        final sushiData = ProductModel(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
        return sushiData;
      },
    ).toList();
  }

  //get img
  /*Future<List<CategoryModel>> fetchImgSushiData() async {
    QuerySnapshot sandwichSnapShot = await _fireStore
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("sushi")
        .get();

    return sandwichSnapShot.docs.map(
      (element) {
        final imgCateSushiData = CategoryModel(image: element["image"]);
        return imgCateSushiData;
      },
    ).toList();
  }*/

  //dessert
  Future<List<ProductModel>> fetchDessertData() async {
    QuerySnapshot shirtSnapShot = await _fireStore
        .collection("category")
        .doc("EE0EGk3jFHbcL1ioSad6")
        .collection("dessert")
        .get();
    return shirtSnapShot.docs.map(
      (element) {
        final dessertData = ProductModel(
            image: element["image"],
            name: element["name"],
            price: double.parse(element["price"]));
        return dessertData;
      },
    ).toList();
  }

  //get img
  /*Future<List<CategoryModel>> fetchImgCateDessertData() async {
    QuerySnapshot sandwichSnapShot = await _fireStore
        .collection("categoryimage")
        .doc("MtJVjhMJumreiTBimiyT")
        .collection("dessert")
        .get();
    return sandwichSnapShot.docs.map(
      (element) {
        final imgCateDessertData = CategoryModel(image: element["image"]);
        return imgCateDessertData;
      },
    ).toList();
  }*/
}
