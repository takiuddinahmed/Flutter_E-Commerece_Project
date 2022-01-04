import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/constant.dart';
import 'package:flutter_ecommerce_project/screen_config.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({ Key? key }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
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
          SizedBox(height: getProportionateScreenHeight(30)),
          PasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          forgotPassword(),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: FlatButton(
                color: kPrimaryColor,
                onPressed: (){},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(25))
                ),
                child: Text("Sign In"),
              )
            )
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
            if(value!.length==0){
              return kEmailNullError;
            }
            if (!emailValidatorRegExp.hasMatch(value)){
              return kInvalidEmailError;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
  }
  TextFormField PasswordFormField() {
    return TextFormField(
          controller: passwordController,
          keyboardType: TextInputType.emailAddress,
          obscureText: passWordHide,
          decoration: InputDecoration(
            hintText: "Please enter pasword",
            labelText: "Password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 20, 8),
              child: IconButton(
                onPressed: (){
                  setState(() {
                    passWordHide = !passWordHide;
                  });
                }, 
                icon: Icon(Icons.visibility)),
            )
          ),
          validator: (value){
            if(value!.length==0){
              return kPassNullError;
            }
            if (value!.length < 6){
              return kShortPassError;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
  }
}

class forgotPassword extends StatelessWidget {
  const forgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        GestureDetector(
          onTap: (){
            print("formlakfj");
          },
          child: Text(
            "Forgot Password",
            style: TextStyle(decoration: TextDecoration.underline,)
          ),
        )
      ],
    );
  }
}