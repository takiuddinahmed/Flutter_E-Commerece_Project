import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/screens/signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body()
    );
  }
}