import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Text Styles
///
/// A color can be specified for a Text Style:
///
/// ```
///   TextStyles.h1(color: Colors.black);
/// ```
///
/// If not specified, it will defafult to [Colors.white]
class TextStyles {
  static TextStyle h1({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 22.0,
        color: color,
      ));

  static TextStyle h2({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 18.0,
        color: color,
      ));

  static TextStyle h4({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 14.0,
      ));

  static TextStyle h5({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 12.0,
        color: color,
      ));

  static TextStyle link({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 16.0,
        color: color,
      ));

  static TextStyle subtitle({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 16.0,
        color: color,
      ));

  static TextStyle tabSelected({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 14.0,
        color: color,
      ));

  static TextStyle tabDeselected({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        color: color,
      ));

  static TextStyle paragraphSmall({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        color: color,
      ));

  static TextStyle smallCaps({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
        color: color,
      ));
}
