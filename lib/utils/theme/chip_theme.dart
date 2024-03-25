import 'package:flutter/material.dart';
import 'package:ta_ecommerce/utils/constans/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: TColors.grey.withOpacity(0.4),
    labelStyle: TextStyle(color: TColors.black),
    selectedColor: TColors.primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: TColors.white,
  );
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: TColors.darkerGrey,
    labelStyle: TextStyle(color: TColors.white),
    selectedColor: TColors.primaryColor,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: TColors.white,
  );
}
