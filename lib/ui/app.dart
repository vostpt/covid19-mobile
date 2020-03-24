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
import 'package:covid19mobile/providers/faq_category_provider.dart';
import 'package:covid19mobile/providers/faq_provider.dart';
import 'package:covid19mobile/providers/initiatives_provider.dart';
import 'package:covid19mobile/providers/measure_provider.dart';
import 'package:covid19mobile/providers/notifications_provider.dart';
import 'package:covid19mobile/providers/remote_work_provider.dart';
import 'package:covid19mobile/providers/slider_provider.dart';
import 'package:covid19mobile/providers/stats_provider.dart';
import 'package:covid19mobile/providers/videos_provider.dart';
import 'package:covid19mobile/resources/constants.dart';
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
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        Provider<AppBloc>.value(value: AppBloc()),
        ChangeNotifierProvider<StatsProvider>.value(value: StatsProvider()),
        ChangeNotifierProvider<RemoteWorkProvider>.value(value: RemoteWorkProvider()),
        ChangeNotifierProvider<FaqProvider>.value(value: FaqProvider()),
        ChangeNotifierProvider<VideosProvider>.value(
          value: VideosProvider(),
        ),
        ChangeNotifierProvider<InitiativesProvider>.value(
          value: InitiativesProvider(),
        ),
        ChangeNotifierProvider<NotificationsProvider>.value(
          value: NotificationsProvider(),
        ),
        ChangeNotifierProvider<MeasuresProvider>.value(
          value: MeasuresProvider(),
        ),
        ChangeNotifierProvider<SliderProvider>.value(
          value: SliderProvider(),
        ),
        ChangeNotifierProvider<FaqCategoryProvider>.value(
          value: FaqCategoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Covid 19 App',
        localizationsDelegates: [
          S.delegate,
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
              page = LicensePage();
              break;
          }
          return CupertinoPageRoute(builder: (_) => page, settings: settings);
        },
      ),
    );
  }
}
