// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

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

  String get checkDetails {
    return Intl.message(
      'Ver detalhes',
      name: 'checkDetails',
      desc: '',
      args: [],
    );
  }

  /// `covid19@mne.pt`
  String get contactsPageMNEEmail {
    return Intl.message(
      'covid19@mne.pt',
      name: 'contactsPageMNEEmail',
      desc: '',
      args: [],
    );
  }

  /// `Canal do Ministério dos Negócios Estrangeiros de emergência aos portugueses em viagem.`
  String get contactsPageMNEEmailText {
    return Intl.message(
      'Canal do Ministério dos Negócios Estrangeiros de emergência aos portugueses em viagem.',
      name: 'contactsPageMNEEmailText',
      desc: '',
      args: [],
    );
  }

  /// `+351 217 929 755`
  String get contactsPageMNENumber {
    return Intl.message(
      '+351 217 929 755',
      name: 'contactsPageMNENumber',
      desc: '',
      args: [],
    );
  }

  /// `Linha do Ministério dos Negócios Estrangeiros de emergência aos portugueses em viagem.`
  String get contactsPageMNENumberText {
    return Intl.message(
      'Linha do Ministério dos Negócios Estrangeiros de emergência aos portugueses em viagem.',
      name: 'contactsPageMNENumberText',
      desc: '',
      args: [],
    );
  }

  /// `covid19.min-saude.pt`
  String get contactsPageMSWeb {
    return Intl.message(
      'covid19.min-saude.pt',
      name: 'contactsPageMSWeb',
      desc: '',
      args: [],
    );
  }

  /// `Plataforma da DGS para esclarecimentos sobre a COVID-19.`
  String get contactsPageMSWebText {
    return Intl.message(
      'Plataforma da DGS para esclarecimentos sobre a COVID-19.',
      name: 'contactsPageMSWebText',
      desc: '',
      args: [],
    );
  }

  /// `atendimento@SNS24.gov.pt`
  String get contactsPageSNSEmail {
    return Intl.message(
      'atendimento@SNS24.gov.pt',
      name: 'contactsPageSNSEmail',
      desc: '',
      args: [],
    );
  }

  /// `Canal SNS 24 para esclarecimentos de dúvidas. Não utilizar para diagnóstico médico.`
  String get contactsPageSNSEmailText {
    return Intl.message(
      'Canal SNS 24 para esclarecimentos de dúvidas. Não utilizar para diagnóstico médico.',
      name: 'contactsPageSNSEmailText',
      desc: '',
      args: [],
    );
  }

  /// `808 24 24 24`
  String get contactsPageSNSNumber {
    return Intl.message(
      '808 24 24 24',
      name: 'contactsPageSNSNumber',
      desc: '',
      args: [],
    );
  }

  /// `Linha SNS 24 para esclarecimentos de diagnóstico médico.`
  String get contactsPageSNSNumberText {
    return Intl.message(
      'Linha SNS 24 para esclarecimentos de diagnóstico médico.',
      name: 'contactsPageSNSNumberText',
      desc: '',
      args: [],
    );
  }

  /// `300 502 502`
  String get contactsPageSSNumber {
    return Intl.message(
      '300 502 502',
      name: 'contactsPageSSNumber',
      desc: '',
      args: [],
    );
  }

  /// `Linha Segurança Social para esclarecimentos sobre assistência a familiares, baixas e quarentena.`
  String get contactsPageSSNumberText {
    return Intl.message(
      'Linha Segurança Social para esclarecimentos sobre assistência a familiares, baixas e quarentena.',
      name: 'contactsPageSSNumberText',
      desc: '',
      args: [],
    );
  }

  /// `Contactos úteis`
  String get contactsPageTitle {
    return Intl.message(
      'Contactos úteis',
      name: 'contactsPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred`
  String get defaultError {
    return Intl.message(
      'An error has occurred',
      name: 'defaultError',
      desc: '',
      args: [],
    );
  }

  /// `Entidade Responsável`
  String get faqPageResponsableEntity {
    return Intl.message(
      'Entidade Responsável',
      name: 'faqPageResponsableEntity',
      desc: '',
      args: [],
    );
  }

  /// `Perguntas Frequentes`
  String get faqPageTitle {
    return Intl.message(
      'Perguntas Frequentes',
      name: 'faqPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Que notificações vai receber?\nInformações importantes sobre atualização dos dados constantes nesta aplicação e avisos/alertas das entidades oficiais.`
  String get notificationsPageDescription {
    return Intl.message(
      'Que notificações vai receber?\nInformações importantes sobre atualização dos dados constantes nesta aplicação e avisos/alertas das entidades oficiais.',
      name: 'notificationsPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Notificações`
  String get notificationsPageReceiveNotifcations {
    return Intl.message(
      'Notificações',
      name: 'notificationsPageReceiveNotifcations',
      desc: '',
      args: [],
    );
  }

  /// `Estatísticas`
  String get notificationsPageReceiveStats {
    return Intl.message(
      'Estatísticas',
      name: 'notificationsPageReceiveStats',
      desc: '',
      args: [],
    );
  }

  /// `Medidas do Governo`
  String get notificationsPageReceiveMeasures {
    return Intl.message(
      'Medidas do Governo',
      name: 'notificationsPageReceiveMeasures',
      desc: '',
      args: [],
    );
  }

  /// `Perguntas Frequentes`
  String get notificationsPageReceiveQuestions {
    return Intl.message(
      'Perguntas Frequentes',
      name: 'notificationsPageReceiveQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Outras`
  String get notificationsPageReceiveOther {
    return Intl.message(
      'Outras',
      name: 'notificationsPageReceiveOther',
      desc: '',
      args: [],
    );
  }

  /// `Por favor, conceda permissões de notificação.`
  String get notificationsPagePermissionsMissing {
    return Intl.message(
      'Por favor, conceda permissões de notificação.',
      name: 'notificationsPagePermissionsMissing',
      desc: '',
      args: [],
    );
  }

  /// `Abrir definições`
  String get notificationsPageOpenSettings {
    return Intl.message(
      'Abrir definições',
      name: 'notificationsPageOpenSettings',
      desc: '',
      args: [],
    );
  }

  /// `Esta app foi construída com o apoio da VOST PT e Flutter Portugal`
  String get screenAboutBuilt {
    return Intl.message(
      'Esta app foi construída com o apoio da VOST PT e Flutter Portugal',
      name: 'screenAboutBuilt',
      desc: '',
      args: [],
    );
  }

  /// `Esta App pretende ser um guia prático para apoiar cidadãos, famílias e empresas no combate aos efeitos causados pelo COVID-19. Aqui poderá encontrar toda a informação e conhecer os apoios a que tem direito.`
  String get screenAboutContent1 {
    return Intl.message(
      'Esta App pretende ser um guia prático para apoiar cidadãos, famílias e empresas no combate aos efeitos causados pelo COVID-19. Aqui poderá encontrar toda a informação e conhecer os apoios a que tem direito.',
      name: 'screenAboutContent1',
      desc: '',
      args: [],
    );
  }

  /// `Consulte as boas práticas e as recomendações das autoridades de Saúde, conheça os melhores conselhos para trabalhar a partir de casa e saiba como recorrer aos serviços públicos sem ter de se deslocar.`
  String get screenAboutContent2 {
    return Intl.message(
      'Consulte as boas práticas e as recomendações das autoridades de Saúde, conheça os melhores conselhos para trabalhar a partir de casa e saiba como recorrer aos serviços públicos sem ter de se deslocar.',
      name: 'screenAboutContent2',
      desc: '',
      args: [],
    );
  }

  /// `Poderá ainda ficar a conhecer as medidas excecionais adotadas pelo Governo em cada área governativa e acompanhar as evoluções do estado epidemiológico do País. Está também disponível para consulta a legislação especificamente aprovada, bem como as diferentes comunicações do Governo nesta matéria.`
  String get screenAboutContent3 {
    return Intl.message(
      'Poderá ainda ficar a conhecer as medidas excecionais adotadas pelo Governo em cada área governativa e acompanhar as evoluções do estado epidemiológico do País. Está também disponível para consulta a legislação especificamente aprovada, bem como as diferentes comunicações do Governo nesta matéria.',
      name: 'screenAboutContent3',
      desc: '',
      args: [],
    );
  }

  /// `Além destas informações, pode aceder à lista completa dos contactos de emergência criados pelos diversos serviços públicos para que, de forma simples e eficiente, encontre a resposta que procura.`
  String get screenAboutContent4 {
    return Intl.message(
      'Além destas informações, pode aceder à lista completa dos contactos de emergência criados pelos diversos serviços públicos para que, de forma simples e eficiente, encontre a resposta que procura.',
      name: 'screenAboutContent4',
      desc: '',
      args: [],
    );
  }

  /// `Juntos venceremos este vírus.`
  String get screenAboutContent5 {
    return Intl.message(
      'Juntos venceremos este vírus.',
      name: 'screenAboutContent5',
      desc: '',
      args: [],
    );
  }

  /// `#COVID19PT - 2020 VOSTPT - Voluntários Digitais em Situações de Emergências para Portugal.`
  String get screenAboutFooter1 {
    return Intl.message(
      '#COVID19PT - 2020 VOSTPT - Voluntários Digitais em Situações de Emergências para Portugal.',
      name: 'screenAboutFooter1',
      desc: '',
      args: [],
    );
  }

  /// `Este site e seus materiais encontram-se sob uma licença Creative Commons CC BY-NC-SA: Atribuição-Não Comercial-Compartilha Igual.`
  String get screenAboutFooter2 {
    return Intl.message(
      'Este site e seus materiais encontram-se sob uma licença Creative Commons CC BY-NC-SA: Atribuição-Não Comercial-Compartilha Igual.',
      name: 'screenAboutFooter2',
      desc: '',
      args: [],
    );
  }

  /// `#EstamosOn`
  String get screenAboutHashtag {
    return Intl.message(
      '#EstamosOn',
      name: 'screenAboutHashtag',
      desc: '',
      args: [],
    );
  }

  /// `Sobre`
  String get screenAboutTitle {
    return Intl.message(
      'Sobre',
      name: 'screenAboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notificações`
  String get screenNotificationsTitle {
    return Intl.message(
      'Notificações',
      name: 'screenNotificationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Aguardar Resultados`
  String get statisticsPageAwaitingResults {
    return Intl.message(
      'Aguardar Resultados',
      name: 'statisticsPageAwaitingResults',
      desc: '',
      args: [],
    );
  }

  /// `Casos Confirmados`
  String get statisticsPageConfirmed {
    return Intl.message(
      'Casos Confirmados',
      name: 'statisticsPageConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Dados recolhidos por Data Science for Social Good Portugal, a partir do boletim diário da Direcção Geral de Saúde.`
  String get statisticsPageDataLabel {
    return Intl.message(
      'Dados recolhidos por Data Science for Social Good Portugal, a partir do boletim diário da Direcção Geral de Saúde.',
      name: 'statisticsPageDataLabel',
      desc: '',
      args: [],
    );
  }

  /// `Recuperados`
  String get statisticsPageRecovered {
    return Intl.message(
      'Recuperados',
      name: 'statisticsPageRecovered',
      desc: '',
      args: [],
    );
  }

  /// `Estatísticas`
  String get statisticsPageStatistics {
    return Intl.message(
      'Estatísticas',
      name: 'statisticsPageStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Suspeitos`
  String get statisticsPageSuspects {
    return Intl.message(
      'Suspeitos',
      name: 'statisticsPageSuspects',
      desc: '',
      args: [],
    );
  }

  /// `Óbitos`
  String get statisticsPageDeaths {
    return Intl.message(
      'Óbitos',
      name: 'statisticsPageDeaths',
      desc: '',
      args: [],
    );
  }

  /// `Hospitalizados`
  String get statisticsPageHospitalized {
    return Intl.message(
      'Hospitalizados',
      name: 'statisticsPageHospitalized',
      desc: '',
      args: [],
    );
  }

  /// `Hospitalizados nos Cuidados Intensivos`
  String get statisticsPageHospitalizedUCI {
    return Intl.message(
      'UCI',
      name: 'statisticsPageHospitalizedUCI',
      desc: '',
      args: [],
    );
  }

  /// `Em vigilância`
  String get statisticsPageUnderSurveillance {
    return Intl.message(
      'Em vigilância',
      name: 'statisticsPageUnderSurveillance',
      desc: '',
      args: [],
    );
  }

  /// `Reportar Problema`
  String get screenAboutButtonReport {
    return Intl.message(
      'Reportar Problema',
      name: 'screenAboutButtonReport',
      desc: '',
      args: [],
    );
  }

  /// `Licenças Open-Source`
  String get screenAboutButtonOpenSource {
    return Intl.message(
      'Licenças Open-Source',
      name: 'screenAboutButtonOpenSource',
      desc: '',
      args: [],
    );
  }

  /// `Resposta de Portugal à Covid-19`
  String get homePageTitle {
    return Intl.message(
      'Resposta de Portugal à Covid-19',
      name: 'homePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Vídeos`
  String get screenVideosTitle {
    return Intl.message(
      'Vídeos',
      name: 'screenVideosTitle',
      desc: '',
      args: [],
    );
  }

  /// `Teletrabalho`
  String get screenRemoteWorkTitle {
    return Intl.message(
      'Teletrabalho',
      name: 'screenRemoteWorkTitle',
      desc: '',
      args: [],
    );
  }

  /// `Última actualização`
  String get lastUpdated {
    return Intl.message(
      'Última actualização',
      name: 'lastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Casos confirmados de COVID-19 em Portugal`
  String get homePageConfirmedCases {
    return Intl.message(
      'Casos confirmados de COVID-19 em Portugal',
      name: 'homePageConfirmedCases',
      desc: '',
      args: [],
    );
  }

  /// `Medidas Excecionais`
  String get measuresPageMeasures {
    return Intl.message(
      'Medidas Excecionais',
      name: 'measuresPageMeasures',
      desc: '',
      args: [],
    );
  }

  /// `Medidas excecionais de resposta À COVID-19`
  String get measuresHomepageButton {
    return Intl.message(
      'Medidas excecionais de resposta À COVID-19',
      name: 'measuresHomepageButton',
      desc: '',
      args: [],
    );
  }

  /// `Iniciativas`
  String get initiativesPageTitle {
    return Intl.message(
      'Iniciativas',
      name: 'initiativesPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Licenças Open-Source`
  String get licensesPageTitle {
    return Intl.message(
      'Licenças Open-Source',
      name: 'licensesPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Licenças Open-Source`
  String get licencesPageTitle {
    return Intl.message(
      'Licenças Open-Source',
      name: 'licencesPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sem conexão`
  String get noConnection {
    return Intl.message(
      'Sem conexão',
      name: 'noConnection',
      desc: '',
      args: [],
    );
  }

  /// `Tentar novamente`
  String get buttonTryAgain {
    return Intl.message(
      'Tentar novamente',
      name: 'buttonTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Não conseguimos aceder à Internet para obter os dados mais recentes. Verifica a tua conexão.`
  String get cannotConnectInternetDescription {
    return Intl.message(
      'Não conseguimos aceder à Internet para obter os dados mais recentes. Verifica a tua conexão.',
      name: 'cannotConnectInternetDescription',
      desc: '',
      args: [],
    );
  }

  /// `Novos`
  String get newPlural {
    return Intl.message(
      'Novos',
      name: 'newPlural',
      desc: '',
      args: [],
    );
  }

  /// `Ver Detalhes`
  String get seeDetails {
    return Intl.message(
      'Ver Detalhes',
      name: 'seeDetails',
      desc: '',
      args: [],
    );
  }

  /// `Publicada às`
  String get publishedAt {
    return Intl.message(
      'Publicada às',
      name: 'publishedAt',
      desc: '',
      args: [],
    );
  }

  /// `de`
  String get dateOf {
    return Intl.message(
      'de',
      name: 'dateOf',
      desc: '',
      args: [],
    );
  }

  /// `Últimos 30 dias`
  String get lastMonth {
    return Intl.message(
      'Últimos 30 dias',
      name: 'lastMonth',
      desc: '',
      args: [],
    );
  }

  /// `Últimos 7 dias`
  String get lastWeek {
    return Intl.message(
      'Últimos 7 dias',
      name: 'lastWeek',
      desc: '',
      args: [],
    );
  }

  /// `Tudo`
  String get all {
    return Intl.message(
      'Tudo',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Casos por dia`
  String get statisticsNewCases {
    return Intl.message(
      'Casos por dia',
      name: 'statisticsNewCases',
      desc: '',
      args: [],
    );
  }

  /// `Total de Confirmados`
  String get statisticsTotalConfirmed {
    return Intl.message(
      'Total de Confirmados',
      name: 'statisticsTotalConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Casos Confirmados`
  String get statisticsConfirmedCasesTitle {
    return Intl.message(
      'Casos Confirmados',
      name: 'statisticsConfirmedCasesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Óbitos Confirmados`
  String get statisticsDeathCasesTitle {
    return Intl.message(
      'Óbitos Confirmados',
      name: 'statisticsDeathCasesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Linear`
  String get linear {
    return Intl.message(
      'Linear',
      name: 'linear',
      desc: '',
      args: [],
    );
  }

  /// `Log`
  String get logaritmicShort {
    return Intl.message(
      'Log',
      name: 'logaritmicShort',
      desc: '',
      args: [],
    );
  }

  /// `Casos por idade`
  String get statisticsNewCasesByAgeGroupAndSex {
    return Intl.message(
      'Casos por idade',
      name: 'statisticsNewCasesByAgeGroupAndSex',
      desc: '',
      args: [],
    );
  }

  /// `Sintomas`
  String get statisticsSymptoms {
    return Intl.message(
      'Sintomas',
      name: 'statisticsSymptoms',
      desc: '',
      args: [],
    );
  }

  /// `Tosse`
  String get symptomCough {
    return Intl.message(
      'Tosse',
      name: 'symptomCough',
      desc: '',
      args: [],
    );
  }

  /// `Febre`
  String get symptomFever {
    return Intl.message(
      'Febre',
      name: 'symptomFever',
      desc: '',
      args: [],
    );
  }

  /// `Dificuldades\nrespiratórias`
  String get symptomBreathingDifficulties {
    return Intl.message(
      'Dificuldades\nrespiratórias',
      name: 'symptomBreathingDifficulties',
      desc: '',
      args: [],
    );
  }

  /// `Cefeleia`
  String get symptomHeadache {
    return Intl.message(
      'Cefeleia',
      name: 'symptomHeadache',
      desc: '',
      args: [],
    );
  }

  /// `Dores\nmusculares`
  String get symptomMusclePain {
    return Intl.message(
      'Dores\nmusculares',
      name: 'symptomMusclePain',
      desc: '',
      args: [],
    );
  }

  /// `Fraqueza\ngeneralizada`
  String get symptomGenealizedWeakness {
    return Intl.message(
      'Fraqueza\ngeneralizada',
      name: 'symptomGenealizedWeakness',
      desc: '',
      args: [],
    );
  }

  /// `Óbitos por dia`
  String get statisticsNewDeathPerDay {
    return Intl.message(
      'Óbitos por dia',
      name: 'statisticsNewDeathPerDay',
      desc: '',
      args: [],
    );
  }

  /// `Óbitos por idade`
  String get statisticsNewDeathPerAge {
    return Intl.message(
      'Óbitos por idade',
      name: 'statisticsNewDeathPerAge',
      desc: '',
      args: [],
    );
  }

  /// `Internados`
  String get statisticsHospitalizedCasesTitle {
    return Intl.message(
      'Internados',
      name: 'statisticsHospitalizedCasesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recuperados`
  String get statisticsRecoveredCasesTitle {
    return Intl.message(
      'Recuperados',
      name: 'statisticsRecoveredCasesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recuperados por dia`
  String get statisticsRecoveredPerDay {
    return Intl.message(
      'Recuperados por dia',
      name: 'statisticsRecoveredPerDay',
      desc: '',
      args: [],
    );
  }

  /// `Total Recuperados`
  String get statisticsRecoveredCases {
    return Intl.message(
      'Total Recuperados',
      name: 'statisticsRecoveredCases',
      desc: '',
      args: [],
    );
  }

  /// `Proporção UCI`
  String get statisticsPageHospitalizedPorpositions {
    return Intl.message(
      'Proporção UCI',
      name: 'statisticsPageHospitalizedPorpositions',
      desc: '',
      args: [],
    );
  }

  /// `Internados`
  String get hospitalized {
    return Intl.message(
      'Internados',
      name: 'hospitalized',
      desc: '',
      args: [],
    );
  }

  /// `UCI`
  String get ucihospitalized {
    return Intl.message(
      'UCI',
      name: 'ucihospitalized',
      desc: '',
      args: [],
    );
  }

  /// `Masculino`
  String get male {
    return Intl.message(
      'Masculino',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Feminino`
  String get female {
    return Intl.message(
      'Feminino',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Evolução`
  String get statisticsPageHospitalizedEvolution {
    return Intl.message(
      'Evolução',
      name: 'statisticsPageHospitalizedEvolution',
      desc: '',
      args: [],
    );
  }

  /// `Total de Óbitos`
  String get statisticsDeathsTotalTitle {
    return Intl.message(
      'Total de Óbitos',
      name: 'statisticsDeathsTotalTitle',
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
