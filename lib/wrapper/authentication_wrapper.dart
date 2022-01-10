import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/screens/home/home_screen.dart';
import 'package:flutter_ecommerce_project/screens/signin/signin.dart';
import 'package:logger/logger.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if(snapshot.hasData){
          FirebaseAuth.instance.currentUser!.reload();
          if(!snapshot.data!.emailVerified){
            return SignInScreen();
          }
          return HomeScreen();
        }
        return SignInScreen();
      }
    );
    // return HomeScreen();
  }
}