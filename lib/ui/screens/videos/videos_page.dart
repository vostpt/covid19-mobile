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
import 'package:covid19mobile/bloc/base_bloc.dart';
import 'package:covid19mobile/model/video_model.dart';
import 'package:covid19mobile/providers/videos_provider.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/widgets/card_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class VideosPage extends BasePage {
  /// Faqs page view
  VideosPage({Key key, this.title}) : super(key: key);

  /// Title of the page view
  final String title;

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends BaseState<VideosPage, AppBloc> {
  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  /// For the initial list of faqs
  List<VideoModel> _videos = [];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
    ]);

    /// TODO: in case of slow connection show loading?

    /// Gets all faqs from the Provider or the Modal Route arguments
    ///
    /// If pushing from home and faqs have initial data
    /// In case of no initial data reverts to fetch faqs
    /// and update with the Provider
    _videos = Provider.of<VideosProvider>(context).videos ??
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          widget.title.toUpperCase(),
          style: TextStyles.h2(color: Covid19Colors.darkGreyLight),
        ),
      ),
      body: Container(
        child: ListView.separated(
            itemBuilder: (context, index) => CardVideo(
                  backgroundUrl: _videos[index].getVideoThumbnail(),
                  label: _videos[index].postTitle,
                  onPressed: () => Navigator.of(context).pushNamed(
                      routeVideoPlayer,
                      arguments: _videos[index].getVideoId()),
                  labelAlignment: Alignment.topLeft,
                ),
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 12.0,
              );
            },
            itemCount: _videos != null ? _videos.length : 0),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    /// In case [_faqs] is null then fetch if again
    if (_videos == null || _videos.isEmpty) {
      bloc.getVideos();
    }
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is VideosResultStream) {
      /// Updates faqs list on the provider
      Provider.of<VideosProvider>(context, listen: false)
          .setVideos(result.model);

      /// Updates videos list
      _videos = result.model;
    }
  }
}
