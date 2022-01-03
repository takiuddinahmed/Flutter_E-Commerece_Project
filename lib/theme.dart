
import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    fontFamily: "muli",
    primarySwatch: Colors.deepOrange
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 5.0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.black
    ) ,
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
      ),
    centerTitle: true,
  );
}