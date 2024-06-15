import 'package:flutter/material.dart';
import 'package:taxi_calculate/src/constants/colors.dart';
import 'package:taxi_calculate/src/utils/theme/widget_themes/evaluated_button_themes.dart';
import 'package:taxi_calculate/src/utils/theme/widget_themes/outline_button_themes.dart';
import 'package:taxi_calculate/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:taxi_calculate/src/utils/theme/widget_themes/text_themes.dart';

class TaxiAppTheme {
  TaxiAppTheme._();
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    textTheme: AppTextThemes.lightTextTheme,
    scaffoldBackgroundColor: bgColor,
    outlinedButtonTheme: AppOutlineButtonThemes.lightOutlineButtonTheme,
    elevatedButtonTheme: AppEvaluatedButtonThemes.lightEvaluatedButtonTheme,
    inputDecorationTheme:AppTextFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: AppTextThemes.lightTextTheme,
    outlinedButtonTheme: AppOutlineButtonThemes.darkOutlineButtonTheme,
    elevatedButtonTheme: AppEvaluatedButtonThemes.darkEvaluatedButtonTheme,
      inputDecorationTheme:AppTextFieldTheme.darkInputDecorationTheme
  );
}
