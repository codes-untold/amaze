import 'package:flutter/material.dart';

const String UPPER_CASE_CHECK = "UPPER_CASE_CHECK";
const String LOWER_CASE_CHECK = "LOWER_CASE_CHECK";
const String SPECIAL_SYMBOL_CHECK = "SPECIAL_SYMBOL_CHECK";

class Palette {
  // separate with theme scale

  // light-themed based
  static const Color white = Color(0xfffafafa);
  static const Color textWhite = Color(0xffffffff);
  static const Color gradientText = Color(0xffE6007E);
  static const Color buttonGradient1 = Color(0xffE6007E);
  static const Color buttonGradient2 = Color(0xffB800E6);
  static const Color iconBg = Color(0xffF6F7F7);
  static const Color iconColor = Color(0xffc4c4c4);
  static const Color bgColor = Color(0xffe5e5e5);
  static const Color textFieldBorder = Color(0xffcbc8d2);

  static const Color errorField = Color(0xffe6007e);
  static const Color fieldText = Color(0xff979797);
  static const Color telBorder = Color(0xff140432);

  static const Color selectGreen = Color(0xff299B01);
  static const Color gray = Color(0xfff4f4f4);
  static const Color textBlue = Color(0xff1D1A42);
  static const Color gray2 = Color(0xff76768D);

// dark-theme based
//background: #76768D;

}

class Userdata {
  static String? userToken;
}
