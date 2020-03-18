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
  static TextStyle h1({Color color = Colors.white}) => GoogleFonts.lato(
        fontWeight: FontWeight.w900,
        height: 22.0,
        color: color,
      );

  static TextStyle h2({Color color = Colors.white}) => GoogleFonts.lato(
        fontWeight: FontWeight.w900,
        height: 18.0,
        color: color,
      );

  static TextStyle h4({Color color = Colors.white}) => GoogleFonts.lato(
        fontWeight: FontWeight.w900,
        height: 14.0,
      );

  static TextStyle h5({Color color = Colors.white}) => GoogleFonts.lato(
        fontWeight: FontWeight.w900,
        height: 12.0,
      );

  static TextStyle link({Color color = Colors.white}) => GoogleFonts.lato(
        fontWeight: FontWeight.w900,
        height: 16.0,
      );

  static TextStyle subtitle({Color color = Colors.white}) => GoogleFonts.lato(
        fontWeight: FontWeight.w900,
        height: 16.0,
      );

  static TextStyle tabSelected({Color color = Colors.white}) =>
      GoogleFonts.lato(
        fontWeight: FontWeight.w900,
        height: 14.0,
      );

  static TextStyle tabDeselected({Color color = Colors.white}) =>
      GoogleFonts.lato(
        fontWeight: FontWeight.normal,
        height: 16.0,
      );

  static TextStyle paragraphSmall({Color color = Colors.white}) =>
      GoogleFonts.lato(
        fontWeight: FontWeight.normal,
        height: 14.0,
      );

  static TextStyle smallCaps({Color color = Colors.white}) => GoogleFonts.lato(
        fontWeight: FontWeight.normal,
        height: 10.0,
      );
}
