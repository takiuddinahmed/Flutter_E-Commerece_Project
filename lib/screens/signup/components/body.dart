
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/constant.dart';
import 'package:flutter_ecommerce_project/screen_config.dart';
import 'package:flutter_ecommerce_project/screens/signup/components/sign_up_form.dart';

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
                Text("Register Account",
                style: headingStyle,
                ),
                Text(
                  "Complete your details or continue\n with social media",
                  textAlign: TextAlign.center, ),
                SizedBox(height: SizeConfig.screenHeight * 0.04,),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.1,),
                Text(
                  "By continuing your confirm that you agree\n with our Terms and Conditions",
                  textAlign: TextAlign.center,
                  )
              ],
            ),
          ),
        )
      ));
  }
}