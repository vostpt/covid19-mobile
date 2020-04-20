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

import 'dart:async';

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
import 'package:covid19mobile/resources/icons_svg.dart';
import 'package:covid19mobile/ui/app.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/assets/images.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../../bloc/app_bloc.dart';
import '../../../bloc/base_bloc.dart';

/// Creates an HomePage extending [BasePage]
/// that is a StatefulWidget
class SplashPage extends BasePage {
  /// Home page view
  SplashPage({Key key, this.title}) : super(key: key);

  /// Title of the page view
  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashBloc> {
  final PublishSubject _statsSubject = PublishSubject<bool>();
  final PublishSubject _sliderSubject = PublishSubject<bool>();
  final PublishSubject _animationComplete = PublishSubject<bool>();

  Stream<bool> get _dataLoaded => Rx.combineLatest2(
              _animationComplete,
              Rx.zip2(_statsSubject, _sliderSubject, (stats, slider) {
                logger.i("_statsSubject : $stats");
                logger.i("_sliderSubject : $slider");
                logger.d("COMBINED: ${stats && slider}");
                return stats && slider;
              }),
              (animation, api) => animation && api)
          .timeout(Duration(seconds: 5), onTimeout: (sink) {
        sink.add(true);
      });

  StreamSubscription<bool> _dataLoadedSubscription;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _dataLoadedSubscription = _dataLoaded.listen((loaded) async {
        logger.d("NEW DATA: $loaded");
        if (loaded) {
          logger.i("I'm inside the LOADED part");
          _dataLoadedSubscription.cancel();
          await Navigator.of(context)
              .pushNamedAndRemoveUntil(routeHome, (_) => false)
              .catchError(logger.e);
          logger.i("After the navigation");
        } else {
          logger.e("NO DATA");
          _insertOverlay(context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor(
        "assets/estamos_on.flr",
        alignment: Alignment.center,
        animation: "in",
        callback: (status) {
          _animationComplete.add(true);
        },
      ),
    );
  }

  @override
  void initBloc(SplashBloc bloc) {
    /// Get Case Stats
    ///
    bloc.bloc.getStats();

    /// Get Slider
    ///
    bloc.bloc.getSlider();

    scheduleMicrotask(() {
      /// Get RemoteWork Posts
      ///
      bloc.bloc.geRemoteWork();

      /// Get Faq Posts
      ///
      bloc.bloc.getFaqCategories();

      /// Get Videos Posts
      ///
      bloc.bloc.getVideos();

      /// Get Measures
      ///
      bloc.bloc.getMeasures();

      /// Get Initiatives Posts
      ///
      bloc.bloc.getInitiatives();

      /// Get Current Covid Status
      ///
      bloc.bloc.getCovidStatus();
    });
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is StatsResultStream) {
      Provider.of<StatsProvider>(context, listen: false).setStats(result.model);

      if (result.state == StateStream.success) {
        _statsSubject.add(true);
      } else if (result.state == StateStream.fail) {
        _statsSubject.add(false);
      }
    }

    if (result is RemoteWorkResultStream) {
      Provider.of<RemoteWorkProvider>(context, listen: false)
          .setRemoteWork(result.model);
    }

    if (result is FaqCategoryResultStream) {
      Provider.of<FaqCategoryProvider>(context, listen: false)
          .setFaqsCategories(result.model);
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

      if (result.state == StateStream.success) {
        _sliderSubject.add(true);
      } else if (result.state == StateStream.fail) {
        _sliderSubject.add(false);
      }
    }

    if (result is FaqResultStream) {
      Provider.of<FaqProvider>(context, listen: false).setFaqs(result.model);
    }
  }

  void _insertOverlay(BuildContext context) {
    logger.e("Called insert overlay");
    var entry;
    entry = OverlayEntry(
        opaque: false,
        builder: (context) {
          return Material(
            child: Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  margin: EdgeInsets.all(24.0),
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(S.of(context).noConnection,
                          style: Theme.of(context).textTheme.display2.copyWith(
                                color: Covid19Colors.darkGrey,
                              )),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Image.asset(
                        connectionError,
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        S.of(context).cannotConnectInternetDescription,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      RaisedButton(
                        onPressed: () {
                          entry.remove();
                          initBloc(bloc);
                        },
                        color: Theme.of(context).primaryColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              S.of(context).buttonTryAgain,
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            SvgIcons.linkSvg(color: Colors.white)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
    return Overlay.of(context).insert(
      entry,
    );
  }

  @override
  void dispose() {
    logger.i("Dispose called");
    _statsSubject.close();
    _sliderSubject.close();
    if (_dataLoadedSubscription != null) {
      _dataLoadedSubscription.cancel();
    }
    super.dispose();
  }
}
