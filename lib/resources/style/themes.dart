import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:flutter/material.dart';

/// List of ThemeData and TextTheme to be used in the app
class Themes {
  static Color colorPrimary = Covid19Colors.green;

  static Color colorAccent = Covid19Colors.blue;

  static Color colorText = Covid19Colors.darkGrey;

  static Color colorTextLight = Covid19Colors.grey;

  static TextTheme defaultTextTheme = TextTheme(
      body1: TextStyles.paragraphNormal(
        color: colorText,
      ),
      display1: TextStyles.h1(
        color: colorPrimary,
      ),
      display2: TextStyles.h2(
        color: colorPrimary,
      ),
      display3: TextStyles.h2(
        color: colorText,
      ),
      display4: TextStyles.h4(
        color: colorPrimary,
      ),
      title: TextStyles.h2(
        color: colorText,
      ),
      subtitle: TextStyles.paragraphSmall(
        color: colorTextLight,
      ),
      button: TextStyles.button(
        color: Colors.white,
      ));

  static ThemeData defaultAppTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Lato",
    primaryColor: colorPrimary,
    accentColor: colorAccent,
    textTheme: defaultTextTheme,
  );
}
