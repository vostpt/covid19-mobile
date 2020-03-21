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

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
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

  String get screenAboutTitle {
    return Intl.message(
      'Sobre',
      name: 'screenAboutTitle',
      desc: '',
      args: [],
    );
  }

  String get screenAboutContent1 {
    return Intl.message(
      'Esta App pretende ser um guia prático para apoiar cidadãos, famílias e empresas no combate aos efeitos causados pelo COVID-19. Aqui poderá encontrar toda a informação e conhecer os apoios a que tem direito.',
      name: 'screenAboutContent1',
      desc: '',
      args: [],
    );
  }

  String get screenAboutContent2 {
    return Intl.message(
      'Consulte as boas práticas e as recomendações das autoridades de Saúde, conheça os melhores conselhos para trabalhar a partir de casa e saiba como recorrer aos serviços públicos sem ter de se deslocar.',
      name: 'screenAboutContent2',
      desc: '',
      args: [],
    );
  }

  String get screenAboutContent3 {
    return Intl.message(
      'Poderá ainda ficar a conhecer as medidas excecionais adotadas pelo Governo em cada área governativa e acompanhar as evoluções do estado epidemiológico do País. Está também disponível para consulta a legislação especificamente aprovada, bem como as diferentes comunicações do Governo nesta matéria.',
      name: 'screenAboutContent3',
      desc: '',
      args: [],
    );
  }

  String get screenAboutContent4 {
    return Intl.message(
      'Além destas informações, pode aceder à lista completa dos contactos de emergência criados pelos diversos serviços públicos para que, de forma simples e eficiente, encontre a resposta que procura.',
      name: 'screenAboutContent4',
      desc: '',
      args: [],
    );
  }

  String get screenAboutContent5 {
    return Intl.message(
      'Juntos venceremos este vírus.',
      name: 'screenAboutContent5',
      desc: '',
      args: [],
    );
  }

  String get screenAboutHashtag {
    return Intl.message(
      '#EstamosOn',
      name: 'screenAboutHashtag',
      desc: '',
      args: [],
    );
  }

  String get screenAboutBuilt {
    return Intl.message(
      'Esta app foi construída com o apoio da VOST PT e Flutter Portugal',
      name: 'screenAboutBuilt',
      desc: '',
      args: [],
    );
  }

  String get screenAboutFooter1 {
    return Intl.message(
      '#COVID19PT - 2020 VOSTPT - Voluntários Digitais em Situações de Emergências para Portugal.',
      name: 'screenAboutFooter1',
      desc: '',
      args: [],
    );
  }

  String get screenAboutFooter2 {
    return Intl.message(
      'Este site e seus materiais encontram-se sob uma licença Creative Commons CC BY-NC-SA: Atribuição-Não Comercial-Compartilha Igual.',
      name: 'screenAboutFooter2',
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
