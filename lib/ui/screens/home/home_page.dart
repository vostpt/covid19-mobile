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

import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/providers/faq_category_provider.dart';
import 'package:covid19mobile/providers/faq_provider.dart';
import 'package:covid19mobile/providers/initiatives_provider.dart';
import 'package:covid19mobile/providers/measure_provider.dart';
import 'package:covid19mobile/providers/remote_work_provider.dart';
import 'package:covid19mobile/providers/slider_provider.dart';
import 'package:covid19mobile/providers/stats_provider.dart';
import 'package:covid19mobile/providers/videos_provider.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/assets/images.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/screens/home/components/card_home.dart';
import 'package:covid19mobile/ui/widgets/card_border_arrow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/app_bloc.dart';
import '../../../bloc/base_bloc.dart';
import '../../app.dart';
import 'components/statistics_button.dart';

/// Creates an HomePage extending [BasePage]
/// that is a StatefulWidget
class HomePage extends BasePage {
  /// Home page view
  HomePage({Key key, this.title}) : super(key: key);

  /// Title of the page view
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, AppBloc> {
  @override
  Widget build(BuildContext context) {
    var stats = Provider.of<StatsProvider>(context);
    logger.i('[StatsProvider] $stats! - ${stats.hashCode}');

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 16.0,
                    ),
                    SafeArea(
                      child: Image.asset(
                        logoEstamosOn,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      S.of(context).homePageTitle.toUpperCase(),
                      style: TextStyles.subtitle(
                        color: Covid19Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    StatisticsButton(
                      callback: () =>
                          Navigator.of(context).pushNamed(routeStatistics),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CardHome(
                      text: S.of(context).measuresHomepageButton.toUpperCase(),
                      callback: () =>
                          Navigator.of(context).pushNamed(routeMeasures),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CardHome(
                      text: S.of(context).screenRemoteWorkTitle.toUpperCase(),
                      callback: () =>
                          Navigator.of(context).pushNamed(routeRemoteWork),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CardHome(
                      text: S.of(context).initiativesPageTitle,
                      callback: () =>
                          Navigator.of(context).pushNamed(routeInitiatives),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CardHome(
                      text: S.of(context).faqPageTitle.toUpperCase(),
                      callback: () =>
                          Navigator.of(context).pushNamed(routeFaqs),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CardHome(
                      text: S.of(context).screenVideosTitle.toUpperCase(),
                      callback: () =>
                          Navigator.of(context).pushNamed(routeVideos),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CardHome(
                      text: S.of(context).contactsPageTitle,
                      callback: () =>
                          Navigator.of(context).pushNamed(routeContacts),
                      backgroundColor: Covid19Colors.green,
                      textColor: Covid19Colors.white,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CardBorderArrow(
                      text:
                          S.of(context).screenNotificationsTitle.toUpperCase(),
                      callback: () =>
                          Navigator.of(context).pushNamed(routeNotifications),
                      textColor: Covid19Colors.darkGrey,
                      borderColor: Covid19Colors.lightGrey,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CardBorderArrow(
                      text: S.of(context).screenAboutTitle.toUpperCase(),
                      callback: () =>
                          Navigator.of(context).pushNamed(routeAbout),
                      textColor: Covid19Colors.darkGrey,
                      borderColor: Covid19Colors.lightGrey,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    /// Get Case Stats
    ///
    bloc.getStats();

    /// Get RemoteWork Posts
    ///
    bloc.geRemoteWork();

    /// Get Faq Posts
    ///
    bloc.getFaqs();

    /// Get Videos Posts
    ///
    bloc.getVideos();

    /// Get Measures
    ///
    bloc.getMeasures();

    /// Get Initiatives Posts
    ///
    bloc.getInitiatives();

    /// Get Slider
    ///
    bloc.getSlider();

    /// GET FAQS categories
    ///
    bloc.getFaqCategories();
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is StatsResultStream) {
      Provider.of<StatsProvider>(context, listen: false).setStats(result.model);
    }

    if (result is RemoteWorkResultStream) {
      Provider.of<RemoteWorkProvider>(context, listen: false)
          .setRemoteWork(result.model);
    }

    if (result is FaqResultStream) {
      Provider.of<FaqProvider>(context, listen: false).setFaqs(result.model);
    }

    if (result is VideosResultStream) {
      Provider.of<VideosProvider>(context, listen: false)
          .setVideos(result.model);
    }

    if (result is MeasuresResultStream) {
      Provider.of<MeasuresProvider>(context, listen: false)
          .setMeasures(result.model);
    }

    if (result is InitiativeResultStream) {
      Provider.of<InitiativesProvider>(context, listen: false)
          .setInitiatives(result.model);
    }

    if (result is SliderResultStream) {
      Provider.of<SliderProvider>(context, listen: false)
          .setSlider(result.model);
    }

    if (result is FaqCategoryResultStream) {
      Provider.of<FaqCategoryProvider>(context, listen: false)
          .setFaqsCategories(result.model);
    }
  }
}
