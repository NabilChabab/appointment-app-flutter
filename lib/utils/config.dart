import 'package:flutter/material.dart';

class Config{
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context){
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

  
}

class AppColor{
  static Color backgroundColor = Colors.black87;
  static Color buttonColor = Color.fromARGB(255, 13, 73, 142);
  static Color textColor1 = Colors.grey.shade700;
  static Color textColor2 = Colors.grey.shade800;
}