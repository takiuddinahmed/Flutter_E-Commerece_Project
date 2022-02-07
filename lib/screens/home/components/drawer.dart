// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/provider/user_provider.dart';
import 'package:flutter_ecommerce_project/services/user_service.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var userData = userProvider.userModel;

    return Drawer(
      child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(userData.name ?? 'Guest' ),
          accountEmail: Text(userData.email ?? 'Guest' ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('J'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.dashboard),
          title: Text('Dashboard'),
        ),
        userData.admin
            ? ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Admin Dashboard'),
              )
            : Container(),
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
