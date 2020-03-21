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

  String get checkDetails {
    return Intl.message(
      'Ver detalhes',
      name: 'checkDetails',
      desc: '',
      args: [],
    );
  }

  String get homePageConfirmedCases {
    return Intl.message(
      'Casos confirmados de COVID-19 em Portugal',
      name: 'homePageConfirmedCases',
      desc: '',
      args: [],
    );
  }

  String get contactsPageTitle {
    return Intl.message(
      'Contactos úteis',
      name: 'contactsPageTitle',
      desc: '',
      args: [],
    );
  }

  String get contactsPageSNSNumber {
    return Intl.message(
      '808 24 24 24',
      name: 'contactsPageSNSNumber',
      desc: '',
      args: [],
    );
  }

  String get contactsPageSNSNumberText {
    return Intl.message(
      'Linha SNS 24 para esclarecimentos de diagnóstico médico.',
      name: 'contactsPageSNSNumberText',
      desc: '',
      args: [],
    );
  }

  String get contactsPageSSNumber {
    return Intl.message(
      '300 502 502',
      name: 'contactsPageSSNumber',
      desc: '',
      args: [],
    );
  }

  String get contactsPageSSNumberText {
    return Intl.message(
      'Linha Segurança Social para esclarecimentos sobre assistência a familiares, baixas e quarentena.',
      name: 'contactsPageSSNumberText',
      desc: '',
      args: [],
    );
  }

  String get contactsPageMNENumber {
    return Intl.message(
      '+351 217 929 755',
      name: 'contactsPageMNENumber',
      desc: '',
      args: [],
    );
  }

  String get contactsPageMNENumberText {
    return Intl.message(
      'Linha do Ministério dos Negócios Estrangeiros de emergência aos portugueses em viagem.',
      name: 'contactsPageMNENumberText',
      desc: '',
      args: [],
    );
  }

  String get contactsPageMSWeb {
    return Intl.message(
      'covid19.min-saude.pt',
      name: 'contactsPageMSWeb',
      desc: '',
      args: [],
    );
  }

  String get contactsPageMSWebText {
    return Intl.message(
      'Plataforma da DGS para esclarecimentos sobre a COVID-19.',
      name: 'contactsPageMSWebText',
      desc: '',
      args: [],
    );
  }

  String get contactsPageSNSEmail {
    return Intl.message(
      'atendimento@SNS24.gov.pt',
      name: 'contactsPageSNSEmail',
      desc: '',
      args: [],
    );
  }

  String get contactsPageSNSEmailText {
    return Intl.message(
      'Canal SNS 24 para esclarecimentos de dúvidas. Não utilizar para diagnóstico médico.',
      name: 'contactsPageSNSEmailText',
      desc: '',
      args: [],
    );
  }

  String get contactsPageMNEEmail {
    return Intl.message(
      'covid19@mne.pt',
      name: 'contactsPageMNEEmail',
      desc: '',
      args: [],
    );
  }

  String get contactsPageMNEEmailText {
    return Intl.message(
      'Canal do Ministério dos Negócios Estrangeiros de emergência aos portugueses em viagem.',
      name: 'contactsPageMNEEmailText',
      desc: '',
      args: [],
    );
  }

  String get faqPageResponsableEntity {
    return Intl.message(
      'Entidade Responsável',
      name: 'faqPageResponsableEntity',
      desc: '',
      args: [],
    );
  }

  String get faqPageTitle {
    return Intl.message(
      'Perguntas Frequentes',
      name: 'faqPageTitle',
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