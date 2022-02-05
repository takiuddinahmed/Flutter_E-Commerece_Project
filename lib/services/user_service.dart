import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class UserService {
  String collectionName = "users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var logger = Logger();

  createUser({String name = "", String email = "", String uid = ""}) async {
    Map<String, dynamic> userMap = {"name": name, "email": email, "uid": uid};
    try {
      _firestore.collection(collectionName).doc(uid).set(userMap);
      logger.i("User created");
      logger.i(userMap);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future<Map<String, dynamic>> getUser(String uid) async {
    try {
      var userDoc = await _firestore.collection(collectionName).doc(uid).get();
      return userDoc.data() ?? {};
    } catch (e) {
      logger.e(e.toString());
    }
    return {};
  }
}
