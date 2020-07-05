///     This program is free software: you can redistribute it and/or modify
///    it under the terms of the GNU General Public License as published by
///    the Free Software Foundation, either version 3 of the License, or
///    (at your option) any later version.
///
///    This program is distributed in the hope that it will be useful,
///    but WITHOUT ANY WARRANTY; without even the implied warranty of
///    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
///    GNU General Public License for more details.
///
///    You should have received a copy of the GNU General Public License
///    along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
  static TextStyle statisticsBig({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.robotoCondensed(
        textStyle: TextStyle(
          color: color,
          fontSize: 36.0,
          fontWeight: FontWeight.w700,
        ),
      );

  static TextStyle h1({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 22.0,
          fontWeight: FontWeight.w900,
        ),
      );

  static TextStyle h2({
    Color color = Covid19Colors.darkGrey,
    FontWeight fontWeight = FontWeight.w900,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 18.0,
          fontWeight: fontWeight,
        ),
      );

  static TextStyle h2Number({
    Color color = Covid19Colors.darkGrey,
    FontWeight fontWeight = FontWeight.w900,
  }) =>
      GoogleFonts.robotoCondensed(
        textStyle: TextStyle(
          color: color,
          fontSize: 18.0,
          fontWeight: fontWeight,
        ),
      );

  static TextStyle statsNumber({
    Color color = Covid19Colors.darkGrey,
    FontWeight fontWeight = FontWeight.w700,
  }) =>
      GoogleFonts.robotoCondensed(
        textStyle: TextStyle(
          color: color,
          fontSize: 20.0,
          fontWeight: fontWeight,
        ),
      );

  static TextStyle h3({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 16.0,
          fontWeight: FontWeight.w900,
        ),
      );

  static TextStyle h3Regular({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle h3Number({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.robotoCondensed(
        textStyle: TextStyle(
          color: color,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle h4({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 14.0,
          fontWeight: FontWeight.w900,
        ),
      );

  static TextStyle h5({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 12.0,
          fontWeight: FontWeight.w900,
        ),
      );

  // This style is named "link" in Figma and Zepplin
  static TextStyle button({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 16.0,
          fontWeight: FontWeight.w900,
        ),
      );

  static TextStyle subtitle({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 16.0,
          fontWeight: FontWeight.w900,
        ),
      );

  static TextStyle tabSelected({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 14.0,
          fontWeight: FontWeight.w900,
        ),
      );

  static TextStyle tabDeselected({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle paragraphSmall({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle paragraphNormal({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle smallCaps({
    Color color = Covid19Colors.grey,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
        ),
      );

  static TextStyle statisticsNumberPrimary({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
          color: color,
          fontSize: 36.0,
          fontWeight: FontWeight.w700,
        ),
      );

  static TextStyle statisticsNumberSecondary({
    Color color = Covid19Colors.darkGrey,
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
          color: color,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ),
      );

  static TextStyle statisticsNumberPercentage({
    Color color = Covid19Colors.grey,
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      );

  static TextStyle statisticsPlotLabel({
    Color color = Covid19Colors.grey,
  }) =>
      GoogleFonts.roboto(
        textStyle: TextStyle(
            color: Covid19Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12),
      );

  static TextStyle textCustom({
    Color color = Covid19Colors.darkGrey,
    double size = 14.0,
    FontWeight fontWeight = FontWeight.normal,
  }) =>
      GoogleFonts.lato(
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.normal,
        ),
      );
}
