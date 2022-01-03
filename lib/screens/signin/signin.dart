import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In" , style: TextStyle(color: Colors.black),),),
      body: Center(child: Text("Sign In")),
    );
  }
}