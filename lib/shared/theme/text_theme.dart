import 'package:flutter/material.dart';

import 'colors.dart';

class KTextStyle {
  static KTextStyle? _instance;

  KTextStyle._internal() {
    _instance = this;
  }

  static KTextStyle of(BuildContext context) {
    return _instance ?? KTextStyle._internal();
  }

  static const String fontFamily = 'URW-DIN-Arabic';

  //Light
  static const Color mainL = Color(0xFF161616);

  //Dark
  static const Color mainD = Color(0xFFFFFFFF);

  //Getters

  TextStyle get ten {
    return const TextStyle(
        color: Colors.white,
        fontSize: 11,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
    );
  }

  TextStyle get body2 {
    return const TextStyle(
      color: mainD,
      fontSize: 12.5,
      fontFamily: fontFamily,
    );
  }

  TextStyle get error {
    return const TextStyle(
        color: Colors.red, fontSize: 15, fontFamily: fontFamily);
  }

  TextStyle get hint {
    return const TextStyle(
      color: KColors.mainColor,
      fontSize: 13,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily,
    );
  }

  TextStyle get twenty {
    return const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    );
  }  TextStyle get logo {
    return const TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get btnTitle {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get fifteen {
    return const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,);
  }

  TextStyle get seven {
    return const TextStyle(
        color: KColors.mainColor,
        fontSize: 8,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold);
  }

}
