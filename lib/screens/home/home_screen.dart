import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/screens/home/components/body.dart';
import 'package:flutter_ecommerce_project/screens/home/components/drawer.dart';
import 'package:icon_badge/icon_badge.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HomeDrawer(),
        appBar: AppBar(
          title: Text("E-commerce", style: TextStyle(color: Colors.black)),
          actions: [
            IconBadge(
              icon: Icon(Icons.shopping_cart),
              itemCount: 2,
              badgeColor: Colors.red,
              itemColor: Colors.white,
              hideZero: true,
              onTap: () {
                print('test');
              },
            ),
          ],
        ),
        body: Body());
  }
}
