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
import 'package:covid19mobile/model/measure_model.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/resources/style/themes.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'measures_extensions.dart';

class MeasureDetail extends StatelessWidget {
  final MeasureModel measure;

  MeasureDetail({Key key, @required this.measure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context)
              .iconTheme
              .copyWith(color: Covid19Colors.darkGrey),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 15,
              ),
              Text(measure.postTitle, style: Themes.defaultTextTheme.headline6),
              Text(measure.parseReadableDate(context),
                  style: TextStyles.smallCaps()),
              Container(
                height: 15,
              ),
              if (measure.parseBody(context) != null) ...[
                measure.parseBody(context),
              ],
            ],
          ),
        )));
  }
}
