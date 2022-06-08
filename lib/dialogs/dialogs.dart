import 'package:book_tracker/constants.dart';
import 'package:book_tracker/size_config.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    
    content: Text(message),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 2),
    shape: StadiumBorder(),
    margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(10)),
    behavior: SnackBarBehavior.floating,
    elevation: 0,
  );

  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
