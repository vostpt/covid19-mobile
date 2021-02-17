import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';

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

class HomeInfoButton extends StatelessWidget {
  @required
  final VoidCallback callback;

  @required
  final Color leftBackgroundColor;

  @required
  final Color rightBackgroundColor;

  @required
  final String title;

  @required
  final String subtitle;

  @required
  final Widget icon;

  const HomeInfoButton({
    Key key,
    this.callback,
    this.leftBackgroundColor,
    this.rightBackgroundColor,
    this.title,
    this.subtitle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
          gradient: LinearGradient(
            colors: [leftBackgroundColor, rightBackgroundColor],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: TextStyles.h3(
                      color: Covid19Colors.white,
                      fontWeight: FontWeight.w400
                    )
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: TextStyles.h1(
                      color: Covid19Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
