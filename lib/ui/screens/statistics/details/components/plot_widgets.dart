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
import 'package:covid19mobile/ui/screens/statistics/details/components/plot_dropdown.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/ui/assets/colors.dart';

class PlotButtons extends StatefulWidget {
  final Function(bool) onLogaritmicSelected;

  PlotButtons({Key key, @required this.onLogaritmicSelected}) : super(key: key);

  @override
  _PlotButtonsState createState() => _PlotButtonsState();
}

class _PlotButtonsState extends State<PlotButtons> {
  bool isLogSelected;

  @override
  void initState() {
    isLogSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            color: Covid19Colors.grey,
            disabledColor: Covid19Colors.white,
            child: Text(
              S.of(context).linear,
              style: isLogSelected ? TextStyles.h1() : TextStyles.h4(),
            ),
            onPressed: () {
              if (isLogSelected) {
                isLogSelected = !isLogSelected;
                widget.onLogaritmicSelected(isLogSelected);
              }
            },
          ),
          FlatButton(
            color: Covid19Colors.grey,
            child: Text(
              S.of(context).logaritmicShort,
              style: (!isLogSelected) ? TextStyles.h1() : TextStyles.h4(),
            ),
            onPressed: () {
              if (!isLogSelected) {
                isLogSelected = !isLogSelected;
                widget.onLogaritmicSelected(isLogSelected);
              }
            },
          ),
        ],
      ),
    );
  }
}

class PlotHeader extends StatelessWidget {
  final String header;

  final Covid19PlotDropdown dropdown;

  PlotHeader({
    Key key,
    @required this.header,
    this.dropdown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              header,
              style: TextStyles.h2(),
            ),
            margin: const EdgeInsets.all(10.0),
          ),
        ),
        Expanded(
          child: dropdown == null
              ? Container()
              : Container(
                  child: dropdown,
                ),
        )
      ],
    );
  }
}
