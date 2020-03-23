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

import 'dart:async';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class LicencesPage extends StatelessWidget {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/licence.txt');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: Theme.of(context).iconTheme.copyWith(
                color: Covid19Colors.darkGrey,
              ),
          backgroundColor: Colors.white,
          title: Text(
            S.of(context).licencesPageTitle.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Covid19Colors.darkGrey),
          ),
        ),
        body: FutureBuilder(
          future: loadAsset(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data);
            }
            return Text("");
          },
        ));
  }
}
