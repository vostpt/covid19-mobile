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
import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DataInformationFooter extends StatelessWidget {
  final CovidStatusStatistics currentStatistics;

  DataInformationFooter({@required this.currentStatistics});

  _launchURL() async {
    if (await canLaunch(dssgSourceCode)) {
      await launch(dssgSourceCode);
    } else {
      throw 'Could not launch $dssgSourceCode';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Text(
            currentStatistics.getReadableLastUpdate(context),
            style: TextStyles.h3Regular(color: Covid19Colors.grey),
          ),
        ),

        /// Data from...
        GestureDetector(
          child: Container(
            margin: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            child: Text(
              S.of(context).statisticsPageDataLabel,
              style: TextStyles.h3Regular(color: Covid19Colors.grey),
            ),
          ),
          onTap: _launchURL,
        ),
      ],
    );
  }
}
