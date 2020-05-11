///    This program is free software: you can redistribute it and/or modify
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

import 'package:flutter/material.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';

class PlotLabelGender extends StatelessWidget {
  final String leftLabel;
  final Color leftColor;
  final String rightLabel;
  final Color rightColor;

  PlotLabelGender({
    @required this.leftLabel,
    @required this.leftColor,
    @required this.rightLabel,
    @required this.rightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            width: 10,
            height: 10,
            child: CustomPaint(
              painter: ColoredSquare(color: leftColor),
            ),
          ),
          Container(
            child: Text(
              leftLabel,
              style: TextStyles.h3Regular(color: Covid19Colors.grey),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            width: 10,
            height: 10,
            child: CustomPaint(
              painter: ColoredSquare(color: rightColor),
            ),
          ),
          Container(
            child: Text(
              rightLabel,
              style: TextStyles.h3Regular(color: Covid19Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class ColoredSquare extends CustomPainter {
  final double width;
  final double height;
  final Color color;
  ColoredSquare({
    @required this.color,
    this.width = 10.0,
    this.height = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTRB(0.0, 0.0, width, height),
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(ColoredSquare oldDelegate) {
    return false;
  }
}
