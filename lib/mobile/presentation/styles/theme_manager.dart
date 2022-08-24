import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_manager.dart';

ThemeData getApplicationTheme ()
{
  return ThemeData(
    // color theme
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.lightGrey,
    splashColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.white,

    appBarTheme: AppBarTheme(
      color: ColorManager.white,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        color: ColorManager.white,
      ),
    ),

  );
}