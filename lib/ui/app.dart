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

import 'dart:io';

import 'package:covid19mobile/bloc/app_bloc.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/providers/covid_status_provider.dart';
import 'package:covid19mobile/providers/faq_category_provider.dart';
import 'package:covid19mobile/providers/faq_provider.dart';
import 'package:covid19mobile/providers/initiatives_provider.dart';
import 'package:covid19mobile/providers/measure_provider.dart';
import 'package:covid19mobile/providers/notifications_provider.dart';
import 'package:covid19mobile/providers/remote_work_provider.dart';
import 'package:covid19mobile/providers/slider_provider.dart';
import 'package:covid19mobile/providers/videos_provider.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/resources/custom_localization.dart';
import 'package:covid19mobile/resources/style/themes.dart';
import 'package:covid19mobile/ui/screens/about/about_page.dart';
import 'package:covid19mobile/ui/screens/contacts/contacts_page.dart';
import 'package:covid19mobile/ui/screens/faqs/faqs_page.dart';
import 'package:covid19mobile/ui/screens/faqs_details/faq_details_page.dart';
import 'package:covid19mobile/ui/screens/home/home_page.dart';
import 'package:covid19mobile/ui/screens/initiatives/initiatives_page.dart';
import 'package:covid19mobile/ui/screens/measures/measures_detail.dart';
import 'package:covid19mobile/ui/screens/measures/measures_page.dart';
import 'package:covid19mobile/ui/screens/notifications/notifications_page.dart';
import 'package:covid19mobile/ui/screens/remote_work/remote_work_page.dart';
import 'package:covid19mobile/ui/screens/remote_work_details/remote_work_details.dart';
import 'package:covid19mobile/ui/screens/splash/splash_page.dart';
import 'package:covid19mobile/ui/screens/statistics/details/confirmed_page.dart';
import 'package:covid19mobile/ui/screens/statistics/details/deaths_page.dart';
import 'package:covid19mobile/ui/screens/statistics/statistics_page.dart';
import 'package:covid19mobile/ui/screens/video_player/video_player_page.dart';
import 'package:covid19mobile/ui/screens/videos/videos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

/// Used to log all the events happening
final Logger logger = Logger(printer: PrettyPrinter(methodCount: 0));

/// Starting class for the project
class CovidApp extends StatelessWidget {
  final AppBloc appBloc = AppBloc();
  final remoteWorkProvider = RemoteWorkProvider();
  final faqProvider = FaqProvider();
  final videosProvider = VideosProvider();
  final initiativeProvider = InitiativesProvider();
  final notificationsProvider = NotificationsProvider();
  final measuresProvider = MeasuresProvider();
  final sliderProvider = SliderProvider();
  final faqsCategoryProvider = FaqCategoryProvider();
  final covidStatusProvider = CovidStatusProvider();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    /// If is an Android then change the status bar color
    /// to dark and text to white
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness:
              Brightness.dark //or set color with: Color(0xFF0000FF)
          ));
    }

    return MultiProvider(
      providers: [
        Provider<AppBloc>.value(value: appBloc),
        ProxyProvider<AppBloc, SplashBloc>(
          update: (_, __, splashBloc) => SplashBloc(appBloc),
        ),
        ChangeNotifierProvider<RemoteWorkProvider>.value(
            value: remoteWorkProvider),
        ChangeNotifierProvider<FaqProvider>.value(value: faqProvider),
        ChangeNotifierProvider<VideosProvider>.value(
          value: videosProvider,
        ),
        ChangeNotifierProvider<InitiativesProvider>.value(
          value: initiativeProvider,
        ),
        ChangeNotifierProvider<NotificationsProvider>.value(
          value: notificationsProvider,
        ),
        ChangeNotifierProvider<MeasuresProvider>.value(
          value: measuresProvider,
        ),
        ChangeNotifierProvider<SliderProvider>.value(
          value: sliderProvider,
        ),
        ChangeNotifierProvider<FaqCategoryProvider>.value(
          value: faqsCategoryProvider,
        ),
        ChangeNotifierProvider<CovidStatusProvider>.value(
          value: covidStatusProvider,
        ),
      ],
      child: MaterialApp(
        title: 'Covid 19 App',
        localizationsDelegates: [
          S.delegate,
          LicensesPageTitleTextLocalDelegate(context),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: Themes.defaultAppTheme,
        initialRoute: routeSplash,
        onGenerateRoute: (settings) {
          var page;
          switch (settings.name) {
            case routeSplash:
              page = SplashPage();
              break;
            case routeHome:
              page = HomePage(title: 'Covid 19 App');
              break;
            case routeStatistics:
              page = StatisticsPage();
              break;
            case routeContacts:
              page = ContactsPage();
              break;
            case routeRemoteWork:
              page = RemoteWorkPage();
              break;
            case routeRemoteWorkDetails:
              page = RemoteWorkDetails();
              break;
            case routeFaqs:
              page = FaqsPage(title: 'Perguntas Frequentes');
              break;
            case routeFaqsDetails:
              page = FaqsDetails(title: '', faqs: settings.arguments);
              break;
            case routeVideos:
              page = VideosPage(title: 'Vídeos');
              break;
            case routeAbout:
              page = AboutPage();
              break;
            case routeVideoPlayer:
              page = VideoPlayerPage();
              break;
            case routeInitiatives:
              page = InitiativesPage();
              break;
            case routeNotifications:
              page = NotificationsPage();
              break;
            case routeMeasures:
              page = MeasuresPage(title: 'Medidas Excecionais');
              break;
            case routeMeasuresDetails:
              page = MeasureDetail(measure: settings.arguments);
              break;
            case routeLicences:
              page = LicensePage(applicationName: "Estamos ON - Covid19");
              break;
            case routeStatisticsConfirmed:
              page = StatisticsConfirmed();
              break;
            case routeStatisticsDeaths:
              page = StatisticsDeaths();
              break;
            case routeStatisticsRecovered:
              page = StatisticsConfirmed();
              break;
            case routeStatisticsHospitalized:
              page = StatisticsConfirmed();
              break;
          }
          return CupertinoPageRoute(builder: (_) => page, settings: settings);
        },
      ),
    );
  }
}
