import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_project/model/user_model.dart';
import 'package:logger/logger.dart';

class UserService {
  String collectionName = "users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var logger = Logger();

  createUser({String name = "", String email = "", String uid = ""}) async {
    Map<String, dynamic> userMap = {
      UserModel.NAME_KEY: name,
      UserModel.EMAIL_KEY: email,
      UserModel.UID_KEY: uid,
      UserModel.ADMIN_KEY: false
    };
    try {
      _firestore.collection(collectionName).doc(uid).set(userMap);
      logger.i("User created");
      logger.i(userMap);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      var userDoc = await _firestore.collection(collectionName).doc(uid).get();
      return UserModel.fromSnapshot(userDoc);
    } catch (e) {
      logger.e(e.toString());
      throw e;
    }
  }
}
