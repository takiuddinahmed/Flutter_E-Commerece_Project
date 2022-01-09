import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
              Text("Home Page"),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                }, 
                child: Text("Sign Out")
              )
           
          ],
        ),
      ),
    );
  }
}