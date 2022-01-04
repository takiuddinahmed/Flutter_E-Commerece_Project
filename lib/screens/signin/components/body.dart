import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/constant.dart';
import 'package:flutter_ecommerce_project/screen_config.dart';
import 'package:flutter_ecommerce_project/screens/signin/components/sign_in_form.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Welcome Back",
                style: headingStyle,
                ),
                Text("Sign in with your email and password"),
                SizedBox(height: SizeConfig.screenHeight * 0.04,),
                SignInForm()
              ],
            ),
          ),
        )
      ));
  }
}