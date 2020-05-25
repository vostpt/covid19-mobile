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

import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/providers/covid_status_provider.dart';
import 'package:covid19mobile/resources/icons_svg.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_border.dart';
import 'package:covid19mobile/ui/widgets/button_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsButton extends StatelessWidget {
  final VoidCallback callback;

  const StatisticsButton({Key key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int confirmed =
        Provider.of<CovidStatusProvider>(context).statistics.confirmed;

    return InkWell(
      onTap: callback,
      child: ButtonBackground(
        color: Covid19Colors.red,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: StatisticsBorder(
                    color: Colors.white,
                    text: Text(
                      "$confirmed",
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.red,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Text(
                    S.of(context).homePageConfirmedCases.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                Text(
                  S.of(context).checkDetails,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
                SvgIcons.linkSvg(
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
