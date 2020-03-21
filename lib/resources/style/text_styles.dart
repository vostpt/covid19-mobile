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
  static TextStyle statisticsBig({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 38.0,
        color: color,
      ));

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
        color: color,
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

  // This style is named "link" in Figma and Zepplin
  static TextStyle button({Color color = Covid19Colors.darkGrey}) =>
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

  static TextStyle paragraphNormal({Color color = Covid19Colors.darkGrey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        color: color,
      ));

  static TextStyle smallCaps({Color color = Covid19Colors.grey}) =>
      GoogleFonts.lato(
          textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 15.0,
        color: color,
      ));
}
