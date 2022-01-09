
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/constant.dart';
import 'package:flutter_ecommerce_project/screen_config.dart';

class DefaultButton extends StatelessWidget {
  String text ="";
  Function press = (){};
  Color color = kPrimaryColor;
  DefaultButton({
    required this.text,
    required this.press,
    color = kPrimaryColor 
  }){}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FlatButton(
          color: color,
          onPressed: (){press();},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(25))
          ),
          child: Text(text, style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenHeight(20)
          ))
        )
      )
    );
  }
}
