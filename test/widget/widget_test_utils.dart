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
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:covid19mobile/bloc/app_bloc.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

extension Environment on WidgetTester {
  Future<void> pumpWithEnvironment(Widget subjectToBeTested) async =>
      await pumpWidget(MaterialApp(
        home: Scaffold(body: subjectToBeTested),
      ));

  Future<void> pumpMainProviderWithEnvironment<N extends ChangeNotifier>(
          Widget subjectToBeTested, AppBloc bloc, N notifier) async =>
      await pumpWidget(MultiProvider(
        providers: [
          Provider<AppBloc>.value(value: bloc),
          ChangeNotifierProvider<N>.value(value: notifier),
        ],
        child: MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: Scaffold(body: subjectToBeTested),
        ),
      ));
}
