import 'package:book_tracker/size_config.dart';
import 'package:flutter/material.dart';

final Uri baseURL = Uri.parse('https://fakerapi.it/api/v1/books?_quantity=100');

const kPrimaryColor = Color(0xFF813CF0);
const kDarkBackgroundColor = Color(0xFF000000);
const kCardColor = Color(0xFF111111);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kThirdLightColor = Color(0xFFf0f8ff);
const kSecondaryLightColor = Color(0xFFf5f5f5);
const kPrimaryWhiteColor = Color(0xFFF5F6F9);
const yellow = Color(0xFFFADC4C);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);


const kSecondaryColor = Color(0xFF4c4cff);
const kTextColor = Colors.white;
const kTextDarkColor = Color(0xFF111111);
const kBlackColor = Colors.black54;
const kWhiteBackground = Color(0xFFFFF8F3);
const kAnimationDuration = Duration(milliseconds: 200);
const kDefaultPadding = 20.0;

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  
  height: 1.5,
);
final headingStyle2 = TextStyle(
  fontSize: getProportionateScreenWidth(18),
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
  height: 1.5,
);

final defaultStyle = TextStyle(
  fontSize: getProportionateScreenWidth(15),
  height: 1.5,
);

const kErrorColor = Color(0xFFF03738);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
