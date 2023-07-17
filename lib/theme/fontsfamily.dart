import 'package:flutter/material.dart';

class Typography {
  static const String _FONT_FAMILY = 'Montserrat';

  static TextStyle getTextStyle(
      double fontSize, FontWeight fontWeight, Color color, double height,
      {TextDecoration? textDecoration}) {
    return TextStyle(
      fontFamily: _FONT_FAMILY,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: textDecoration ?? TextDecoration.none,
    );
  }

  static TextStyle getBlackStyle(
      {double fontSize = 14.0,
      Color color = Colors.black,
      double height = 1.0,
      TextDecoration? textDecoration}) {
    return getTextStyle(fontSize, FontWeight.w900, color, height,
        textDecoration: textDecoration);
  }

  static TextStyle getExtraBoldStyle(
      {double fontSize = 14.0,
      Color color = Colors.black,
      double height = 1.0,
      TextDecoration? textDecoration}) {
    return getTextStyle(fontSize, FontWeight.w800, color, height,
        textDecoration: textDecoration);
  }

  static TextStyle getBoldStyle(
      {double fontSize = 14.0,
      Color color = Colors.black,
      double height = 1.0,
      TextDecoration? textDecoration}) {
    return getTextStyle(fontSize, FontWeight.w700, color, height,
        textDecoration: textDecoration);
  }

  static TextStyle getSemiBoldStyle(
      {double fontSize = 14.0,
      Color color = Colors.black,
      double height = 1.0,
      TextDecoration? textDecoration}) {
    return getTextStyle(fontSize, FontWeight.w600, color, height,
        textDecoration: textDecoration);
  }

  static TextStyle getMediumStyle(
      {double fontSize = 14.0,
      Color color = Colors.black,
      double height = 1.0,
      TextDecoration? textDecoration}) {
    return getTextStyle(fontSize, FontWeight.w500, color, height,
        textDecoration: textDecoration);
  }

  static TextStyle getRegularStyle(
      {double fontSize = 14.0,
      Color color = Colors.black,
      double height = 1.0,
      TextDecoration? textDecoration}) {
    return getTextStyle(fontSize, FontWeight.w400, color, height,
        textDecoration: textDecoration);
  }

  static TextStyle getThinStyle(
      {double fontSize = 14.0,
      Color color = Colors.black,
      double height = 1.0,
      TextDecoration? textDecoration}) {
    return getTextStyle(fontSize, FontWeight.w300, color, height,
        textDecoration: textDecoration);
  }

  static TextStyle getLightStyle(
      {double fontSize = 14.0,
      Color color = Colors.black,
      double height = 1.0,
      TextDecoration? textDecoration}) {
    return getTextStyle(fontSize, FontWeight.w200, color, height,
        textDecoration: textDecoration);
  }

  static TextStyle getExtraLightStyle(
      {double fontSize = 14.0,
      Color color = Colors.black,
      double height = 1.0,
      TextDecoration? textDecoration}) {
    return getTextStyle(fontSize, FontWeight.w100, color, height,
        textDecoration: textDecoration);
  }
}
