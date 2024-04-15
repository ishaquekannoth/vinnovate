import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppPaintings {
  static Color appBlack = Colors.black;
  static Color appWideBlack = const Color(0xff3C4C5F);
  static Color appWhite = Colors.white;
  static Color hintColor = const Color(0xff4F4F4F);
  static Color deepPurple = Colors.deepPurple;

  static ThemeData appTheme = ThemeData(
    textTheme: TextTheme(titleSmall: TextStyle(color: AppPaintings.appBlack)),
    primarySwatch: Colors.deepPurple,
  );
  static TextStyle commonStyle = TextStyle(
    color: AppPaintings.appBlack,
    fontSize: 16.h,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );
}

typedef WidgetDataOutFunction<T extends Object> = void Function(T object)?;
extension ValidationString on String {
  bool get isValidEmail {
    RegExp emailRegExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    RegExp nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    RegExp passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}');
    return passwordRegExp.hasMatch(this);
  }
}