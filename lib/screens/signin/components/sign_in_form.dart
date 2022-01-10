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
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              signIn(context);
            }
          )
        ],
      ),
    );
  }

   signIn(BuildContext context) async {
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
        var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
        );

        if(!(credential.user!.emailVerified)){
          snackbarMsg = "Your email is not verified. Please verify your email.";
          // throw {"code": "not verified", "msg":"he is not verified"};
          // throw "not verified";
        }
        else{
          snackbarMsg= "Sign In successfull";
        }
      } on FirebaseAuthException catch (e) {
        switch(e.code){
         case "user-not-found": 
            snackbarMsg = "User Not found";
            break;
          case "wrong-password" :
            snackbarMsg = "Incorrect password";
            break;
          default:
            snackbarMsg = "You r wrong";
            break;
        }
        // snackbarMsg = e.toString();
        logger.e(e);
      }
      finally{
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarMsg),
        ));
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