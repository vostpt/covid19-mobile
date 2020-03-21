// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get defaultError {
    return Intl.message(
      'An error has occurred',
      name: 'defaultError',
      desc: '',
      args: [],
    );
  }

  String get statisticsPageStatistics {
    return Intl.message(
      'Estatísticas',
      name: 'statisticsPageStatistics',
      desc: '',
      args: [],
    );
  }

  String get statisticsPageConfirmed {
    return Intl.message(
      'Confirmados',
      name: 'statisticsPageConfirmed',
      desc: '',
      args: [],
    );
  }

  String get statisticsPageRecovered {
    return Intl.message(
      'Recuperações',
      name: 'statisticsPageRecovered',
      desc: '',
      args: [],
    );
  }

  String get statisticsPageSuspects {
    return Intl.message(
      'Suspeitos',
      name: 'statisticsPageSuspects',
      desc: '',
      args: [],
    );
  }

  String get statisticsPageAwaitingResults {
    return Intl.message(
      'Aguardar Resultados',
      name: 'statisticsPageAwaitingResults',
      desc: '',
      args: [],
    );
  }

  String get statisticsPageDataLabel {
    return Intl.message(
      'Dados DGS via ESRI Portugal',
      name: 'statisticsPageDataLabel',
      desc: '',
      args: [],
    );
  }

  String get lastUpdated {
    return Intl.message(
      'Última actualização: ',
      name: 'lastUpdated',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}