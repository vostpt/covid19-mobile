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

import 'package:covid19mobile/bloc/app_bloc.dart';
import 'package:covid19mobile/generated/l10n.dart';

import 'package:covid19mobile/resources/style/themes.dart';
import 'package:covid19mobile/ui/screens/contacts/contacts_page.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/ui/screens/home/home_page.dart';
import 'package:covid19mobile/ui/screens/statistics/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

/// Used to log all the events happening
final Logger logger = Logger(printer: PrettyPrinter(methodCount: 0));

/// Starting class for the project
class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppBloc>(
      create: (_) => AppBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: MaterialApp(
        title: 'Covid 19 App',
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: Themes.defaultAppTheme,
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage(title: 'Covid 19 App').builder,
          routeStatistics: (_) => StatisticsPage().builder,
          routeContacts: (_) => ContactsPage(),
          routeFaqs: (_) => FaqsPage(title: 'Perguntas Frequentes').builder,
          routeFaqs: (context) => FaqsPage(
                title: 'Perguntas Frequentes',
              ).builder,
        },
      ),
    );
  }
}
