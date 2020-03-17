import 'package:covid19mobile/bloc/app_bloc.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

/// Used to log all the events happening
Logger logger = Logger();

/// Starting class for the project
class CovidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppBloc>(
      create: (_) => AppBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage(title: 'Covid 19 App'),
        },
      ),
    );
  }
}
