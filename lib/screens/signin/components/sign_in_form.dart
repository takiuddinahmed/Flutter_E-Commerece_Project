import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/components/default_button.dart';
import 'package:flutter_ecommerce_project/constant.dart';
import 'package:flutter_ecommerce_project/screen_config.dart';
import 'package:flutter_ecommerce_project/screens/forget_password/forget_password_screen.dart';
import 'package:logger/logger.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({ Key? key }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  var formKey = GlobalKey<FormState>();

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
          DefaultButton(
            text: "Sign In",
            press: (){
              signIn();
            }
          )
        ],
      ),
    );
  }

   signIn() async {
    
    var logger = Logger();
    if(formKey.currentState!.validate()){
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      try {
        var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
        );
        logger.d("sign in completed");
        // StreamBuilder(

        // )

        // showDialog(
        //   context: context, 
        //   builder:(_){
        //     return   AlertDialog(
        //       title: Text("Please wait......"),
        //   );}
        // );
      } on Exception catch (e) {
        logger.e(e);
      }
    }
    else {
      logger.e("Not valid");
    }

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
            if(passwordController.text.isEmpty){
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
            Navigator.push(context, 
            MaterialPageRoute(builder: (_){return ForgetPasswordScreen();}));
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