import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/components/default_button.dart';
import 'package:flutter_ecommerce_project/constant.dart';
import 'package:flutter_ecommerce_project/screen_config.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  var formKey = GlobalKey();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool passWordHide = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          EmailFormField(),
          SizedBox(height: getProportionateScreenHeight(60)),
          DefaultButton(
            text: "Send verification email",
            press: (){}
          )
        ],
      ),
    );
  }

  TextFormField EmailFormField() {
    return TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Please enter your email",
            labelText: "Email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 20, 8),
              child: Icon(Icons.email),
            
            )
          ),
          validator: (value){
            if(emailController.text.isEmpty){
              return kEmailNullError;
            }
            if (!emailValidatorRegExp.hasMatch(emailController.text)){
              return kInvalidEmailError;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
  }
  
}