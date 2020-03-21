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

import 'package:flutter/material.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/assets/dimensions.dart';

class HeaderTabs extends StatelessWidget {
  final String tab0Text;
  final Widget tab0Widget;
  final String tab1Text;
  final Widget tab1Widget;

  HeaderTabs(this.tab0Text, this.tab0Widget, this.tab1Text, this.tab1Widget);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Covid19Colors.lightGrey,
          flexibleSpace: TabBar(
            indicatorPadding:
                EdgeInsets.fromLTRB(tabIndicatorMagin, 0, tabIndicatorMagin, 0),
            indicatorWeight: tabIndicatorWeight,
            indicatorColor: Covid19Colors.green,
            labelColor: Covid19Colors.green,
            unselectedLabelColor: Covid19Colors.darkGrey,
            tabs: [
              Center(
                child: Text(
                  tab0Text.toUpperCase(),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  tab1Text.toUpperCase(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            tab0Widget,
            tab1Widget,
          ],
        ),
      ),
    );
  }
}
