import 'package:flutter/material.dart';

const EdgeInsets appMargin
  = EdgeInsets.only(left: 20.0, top: 50.0, right: 20.0);

const SizedBox spaceV = SizedBox(height: 15.0);
const SizedBox spaceH = SizedBox(width: 15.0);

const TextStyle titleStyle = TextStyle(
    fontSize: 27.0,
    fontWeight: FontWeight.bold,
    color: Colors.white
);

const TextStyle noData = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: mainColor
);

const Color mainColor = Color(0xFFFF9E20);
const Color mainTextColor = Colors.white;

const BoxDecoration background = BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/food_bg.png'),
        fit: BoxFit.fill
    )
);

const List<String> inValidChar = [
  "\\", ".", ",", ";", ":", "'", "\"", "\$", "#", "%"
];

const String userNullError = "Please Enter your username";
const String userInvalid = "Username is not valid";
const String passNullError = "Please Enter your password";
const String passInvalid = "Password is not valid";
const String rePassNullError = "Please Enter your re-password";
const String rePassInvalid = "Re-password is not valid";
const String rePassDiff = "Your re-password is not as same as password";
const String wrongUserOrPass = "Your username or password is not correct";
const String userExisted = "This username already has been used";