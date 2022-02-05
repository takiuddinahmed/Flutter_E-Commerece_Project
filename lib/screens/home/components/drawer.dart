// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/services/user_service.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    User? user = await FirebaseAuth.instance.currentUser ?? null;

    if (user != null) {
      var _user = await UserService().getUser(user.uid);
      setState(() {
        userData = _user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(userData!['name'] ?? 'Guest'),
          accountEmail: Text(userData!['email'] ?? 'Guest'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('J'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text('Dashboard'),
        ),
        ListTile(
          leading: Icon(Icons.online_prediction),
          title: Text('Product'),
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('Cart'),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Sign Out'),
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ],
    ));
  }
}
