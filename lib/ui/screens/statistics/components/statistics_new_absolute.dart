import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/screens/statistics/components/statistics_squared_number.dart';
import 'package:flutter/material.dart';

/// Statistics widget to show a squared new absolute values
class StatisticsNewAbsolute extends StatelessWidget {
  final int value;

  StatisticsNewAbsolute({@required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SquaredNumberWidget(
          value: value,
          style: TextStyles.h1(),
        ),
        Text(
          S.of(context).newPlural,
          style: TextStyles.h3Regular(),
        )
      ],
    );
  }
}
