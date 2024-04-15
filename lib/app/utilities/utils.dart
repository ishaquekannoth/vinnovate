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
