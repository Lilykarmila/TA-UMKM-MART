import 'package:flutter/material.dart';
import 'package:ta_ecommerce/utils/theme/appbar_theme.dart';
import 'package:ta_ecommerce/utils/theme/bottom_sheet_theme.dart';
import 'package:ta_ecommerce/utils/theme/checkbox_theme.dart';
import 'package:ta_ecommerce/utils/theme/chip_theme.dart';
import 'package:ta_ecommerce/utils/theme/elevated_button_theme.dart';
import 'package:ta_ecommerce/utils/theme/outlined_button_theme.dart';
import 'package:ta_ecommerce/utils/theme/text_field_theme.dart';
import 'package:ta_ecommerce/utils/theme/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppbarTheme.lightAppbarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxThemeData,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatesButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppbarTheme.darkAppbarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxThemeData,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatesButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
