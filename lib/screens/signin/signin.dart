import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/screen_config.dart';
import 'package:flutter_ecommerce_project/screens/signin/components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}