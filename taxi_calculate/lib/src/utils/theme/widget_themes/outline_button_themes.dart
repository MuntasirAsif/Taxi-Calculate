import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class AppOutlineButtonThemes {
  AppOutlineButtonThemes._();

  //Light mode Outline Button Theme
  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        foregroundColor: blackColor,
        side: const BorderSide(color: blackColor)),
  );

  //Dark mode Outline Button Theme
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        foregroundColor: Colors.white,
        side: const BorderSide(color: whiteColor)),
  );
}
