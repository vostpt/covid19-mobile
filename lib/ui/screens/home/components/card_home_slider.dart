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

import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:flutter/material.dart';

class CardHomeSlider extends StatelessWidget {
  const CardHomeSlider(Key key, this.titleLabel, this.secondaryLabel,
      this.backgroundPath, this.onTap)
      : super(key: key);

  final String titleLabel;
  final String secondaryLabel;
  final String backgroundPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  backgroundPath,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                )),
            Container(
                padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
                height: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Text(
                      titleLabel.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyles.h1(color: Covid19Colors.white),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Row(children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(5),
                                  height: 30,
                                  color: Covid19Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        secondaryLabel,
                                        style: TextStyles.subtitle(
                                            color: Covid19Colors.green),
                                      ),
                                      SizedBox(width: 7),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 16,
                                        color: Covid19Colors.green,
                                      )
                                    ],
                                  ))
                            ])))
                  ],
                ))
          ]),
        ));
  }
}
