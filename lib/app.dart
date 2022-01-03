import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/screens/signin/signin.dart';
import 'package:flutter_ecommerce_project/theme.dart';

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Ecommerce Project",
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
      theme: theme()
    );
  }
}