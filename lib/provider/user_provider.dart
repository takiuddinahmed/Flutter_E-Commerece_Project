import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_project/model/user_model.dart';
import 'package:flutter_ecommerce_project/services/user_service.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  UserModel _userModel = UserModel();
  FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  UserService _userService = UserService();
  Logger logger = Logger();

  // getters
  User get user => _user;
  UserModel get userModel => _userModel;

  UserProvider.init() {
    _auth.authStateChanges().listen((User? userData) {
      logger.d(userData.toString());
      if (userData == null) {
        notifyListeners();
        return;
      }
      _user = userData;
      _userService.getUser(userData.uid).then((value) {
        _userModel = value;
        notifyListeners();
      });
      logger.i(_userModel.email);
      notifyListeners();
    });
  }
}
