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

import 'dart:io';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/assets/dimensions.dart';
import 'package:flutter/material.dart';

/// List of ThemeData and TextTheme to be used in the app
class Themes {
  static Color colorPrimary = Covid19Colors.green;

  static Color colorAccent = Covid19Colors.blue;

  static Color colorText = Covid19Colors.darkGrey;

  static Color colorTextLight = Covid19Colors.grey;

  static Color backgroundColor = Covid19Colors.paleGrey;

  static Color vostBlue = Covid19Colors.vostBlue;

  static TextTheme defaultTextTheme = TextTheme(
      headline5: TextStyles.h1(),
      caption: TextStyles.paragraphSmall(),
      bodyText2: TextStyles.paragraphNormal(
        color: colorText,
      ),
      headline4: TextStyles.h1(
        color: colorPrimary,
      ),
      headline3: TextStyles.h2(
        color: colorPrimary,
      ),
      headline2: TextStyles.h3(
        color: colorText,
      ),
      headline1: TextStyles.h4(
        color: colorPrimary,
      ),
      headline6: TextStyles.h2(
        color: colorText,
      ),
      subtitle2: TextStyles.paragraphSmall(
        color: colorTextLight,
      ),
      button: TextStyles.button(
        color: vostBlue,
      ));

  static ThemeData defaultAppTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      brightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
      textTheme: defaultTextTheme,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    brightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
    fontFamily: "Lato",
    primaryColor: colorPrimary,
    accentColor: colorPrimary,
    textTheme: defaultTextTheme,
    unselectedWidgetColor: colorPrimary,
    scaffoldBackgroundColor: backgroundColor,
    tabBarTheme: TabBarTheme(
      labelColor: Covid19Colors.green,
      unselectedLabelColor: Covid19Colors.darkGrey,
      indicator: UnderlineTabIndicator(
        borderSide:
            BorderSide(width: tabIndicatorWeight, color: Covid19Colors.green),
        insets: const EdgeInsets.fromLTRB(
            tabIndicatorMagin, 0, tabIndicatorMagin, 0),
      ),
    ),
    canvasColor: Covid19Colors.white,
  );
}
