import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const UID_KEY = 'uid';
  static const NAME_KEY = 'name';
  static const EMAIL_KEY = 'email';
  static const IMAGE_URL_KEY = 'imageUrl';
  static const ADMIN_KEY = 'admin';

  String uid = "";
  String name = "";
  String email = "";
  String imageUrl = "";
  bool admin = false;

  UserModel(
      {this.uid = "",
      this.name = "Guest",
      this.email = "guest@guest.com",
      this.imageUrl = ""});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
    uid = data[UID_KEY] ?? "";
    name = data[NAME_KEY] ?? "";
    email = data[EMAIL_KEY] ?? "";
    imageUrl = data[IMAGE_URL_KEY] ?? "";
    admin = data[ADMIN_KEY] ?? false;
  }
}
