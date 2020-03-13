import 'package:covid19_mobile_triage/bloc/app_bloc.dart';
import 'package:covid19_mobile_triage/generated/l10n.dart';
import 'package:covid19_mobile_triage/ui/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

Logger logger = Logger();

class CovidTriageApp extends StatelessWidget {
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
          '/': (_) => HomePage(title: 'Covid 19 Triage App'),
        },
      ),
    );
  }
}
