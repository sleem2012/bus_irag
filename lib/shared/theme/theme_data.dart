import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'helper.dart';
import 'colors.dart';

class KThemeData {
  static BuildContext? _context;
  static KThemeData? _instance;

  KThemeData._internal() {
    _instance = this;
  }

  static KThemeData of(BuildContext context) {
    _context = context;
    return _instance ?? KThemeData._internal();
  }

  SystemUiOverlayStyle get overlayStyle {
    return Theme.of(_context!).brightness == Brightness.light
        ? _lightOverLay
        : _darkOverLay;
  }

  ThemeData get themeData {
    return Theme.of(_context!).brightness == Brightness.light ? light : dark;
  }

  static ThemeData get light {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.backgroundD,
      appBarTheme: const AppBarTheme(
        color: KColors.backgroundD,
        systemOverlayStyle: _lightOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.accentColor),
      ),
      shadowColor: KColors.shadowD,
      inputDecorationTheme: inputDecorationTheme(),
      iconTheme: const IconThemeData(color: KColors.accentColor),
      elevatedButtonTheme: elevatedBtnTheme(
          shadow: KColors.shadowD, background: KColors.elevatedBoxD),
    );
  }

  static ThemeData get dark {
    return ThemeData.dark().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: KColors.backgroundD,
      appBarTheme: const AppBarTheme(
        color: KColors.backgroundD,
        systemOverlayStyle: _darkOverLay,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: KColors.accentColor),
      ),
      shadowColor: KColors.shadowD,
      inputDecorationTheme: inputDecorationTheme(),
      elevatedButtonTheme: elevatedBtnTheme(
          shadow: KColors.shadowD, background: KColors.elevatedBoxD),
    );
  }

  static ElevatedButtonThemeData elevatedBtnTheme(
      {required Color shadow, required Color background}) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        shadowColor: MaterialStateProperty.all<Color>(shadow),
        elevation: MaterialStateProperty.all<double>(5.0),
        backgroundColor: MaterialStateProperty.all<Color>(background),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(KHelper.btnRadius),
          ),
        ),
      ),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      // border: outlineInputBorder(color: Colors.red, radius: 2),
      disabledBorder: outlineInputBorder(color: Colors.grey, radius: 2),
      errorBorder: outlineInputBorder(color: Colors.red, radius: 2),
      // focusedErrorBorder: outlineInputBorder(color: Colors.grey, radius: 2),
      enabledBorder: outlineInputBorder(
          color: const Color(0xff000000).withOpacity(.4), radius: 2),
      focusedBorder:
          outlineInputBorder(color: KColors.mainColor, radius: 8, width: .6),
    );
  }

  // InputDecoration get inputBorderDecoration {
  //   return Theme.brightness == Brightness.light ? inputDecoration(color: KColors.backgroundDL) : inputDecoration(color: KColors.backgroundDD);
  // }
  //
  // static InputDecoration inputDecoration({required Color color}) => InputDecoration(
  //   border: outlineInputBorder(color: color, radius: 2),
  //   disabledBorder: outlineInputBorder(color: color, radius: 2),
  //   errorBorder: outlineInputBorder(color: color, radius: 2),
  //   focusedErrorBorder: outlineInputBorder(color: color, radius: 2),
  //   enabledBorder: outlineInputBorder(color: color, radius: 2),
  //   focusedBorder: outlineInputBorder(color: color, radius: 2),
  // );

  static OutlineInputBorder outlineInputBorder(
          {double? width, required Color color, required double radius}) =>
      OutlineInputBorder(
        borderSide: BorderSide(width: width ?? .1, color: color),
        borderRadius: BorderRadius.circular(radius),
      );

  static const SystemUiOverlayStyle _darkOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle _lightOverLay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
