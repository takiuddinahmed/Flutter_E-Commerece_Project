import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/components/default_button.dart';
import 'package:flutter_ecommerce_project/constant.dart';
import 'package:flutter_ecommerce_project/screen_config.dart';
import 'package:logger/logger.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({ Key? key }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordComfirmController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool passWordHide = true;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    passwordComfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        EmailFormField(),
        SizedBox(height: getProportionateScreenHeight(30),),
        PasswordFormField(),
        SizedBox(height: getProportionateScreenHeight(30),),
        ConfirmPasswordFormField(),
        SizedBox(height: getProportionateScreenHeight(30),),
        DefaultButton(
          text: "Sign Up",
          press: (){signUp(context);}
        )
      ],),
    );
  }
   // myemai@email.com 


  signUp(BuildContext context) async {
    
    var logger = Logger();
    if(formKey.currentState!.validate()){
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Column(
              children: [
                Text("Please Wait.."),
                SizedBox(height: 20,),
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          );
        });
      String snackbarMsg = "";
      try {
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
        );
        await credential.user!.sendEmailVerification();
        logger.d("sign up completed");
        snackbarMsg = "New account registered. Please verify your email.";

        
      } on FirebaseAuthException catch (e) {
        logger.e(e);
        switch(e.code){
          case  'weak-password':
            snackbarMsg = "Password is weak. Try again with strong password";
            break;
          case 'email-already-in-use':
            snackbarMsg = "Email is already used";
        }
      }
      finally{
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarMsg))
          );
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
  TextFormField ConfirmPasswordFormField() {
    return TextFormField(
          controller: passwordComfirmController,
          keyboardType: TextInputType.emailAddress,
          obscureText: passWordHide,
          decoration: InputDecoration(
            hintText: "Please comfirm pasword",
            labelText: "confirm Password",
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
            if (!(passwordComfirmController.text == passwordController.text)){
              return kMatchPassError;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
  }
}