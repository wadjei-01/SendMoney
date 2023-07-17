library navbar.globals;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  static Color primary = HexColor('#01C7B1');
  static Color secondary = HexColor('#CCF3EF');
  static Color lightGrey = HexColor('#E6EAED');
  static Color darkGrey = HexColor('#9EADBA');
  static Color failedBG = HexColor('#FDB0AC');
  static Color failed = HexColor('#99231D');
  static Color successBG = HexColor('#DBF7E0');
  static Color success = HexColor('#70E083');

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class Values {
  static double borderRadius = 40.r;
  static double smallFontSize = 35.sp;
  static TextStyle smallText = TextStyle(
      fontSize: Values.smallFontSize,
      height: 4.h,
      leadingDistribution: TextLeadingDistribution.even);
}

class Globals {
  static InputDecoration personalDecoration(String type) {
    return InputDecoration(
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.darken(Color.fromARGB(255, 255, 29, 29)),
              width: 2),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 255, 29, 29)),
          borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 213, 213, 213)),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(10)),
      hintText: type,
      contentPadding: const EdgeInsets.only(left: 20),
      border: InputBorder.none,
    );
  }
}
