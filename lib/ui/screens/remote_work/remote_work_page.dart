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
import 'package:covid19mobile/model/remote_work_model.dart';
import 'package:covid19mobile/providers/remote_work_provider.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/widgets/card_border_arrow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoteWorkPage extends BasePage {
  /// Faqs page view
  RemoteWorkPage({Key key, this.title}) : super(key: key);

  /// Title of the page view
  final String title;

  @override
  _RemoteWorkState createState() => _RemoteWorkState();
}

class _RemoteWorkState extends BaseState<RemoteWorkPage, AppBloc> {
  /// For the initial list of faqs
  List<RemoteWorkModel> _remoteWorks = [];

  @override
  Widget build(BuildContext context) {
    /// TODO: in case of slow connection show loading?
    /// Gets all faqs from the Provider or the Modal Route arguments
    ///
    /// If pushing from home and faqs have initial data
    /// In case of no initial data reverts to fetch faqs
    /// and update with the Provider
    _remoteWorks = Provider.of<RemoteWorkProvider>(context).remoteWorks ??
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
        margin: EdgeInsets.all(16.0),
        child: ListView.separated(
            itemBuilder: (context, index) => CardBorderArrow(
                  text: _remoteWorks[index].postTitle,
                  textColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  callback: () => Navigator.of(context).pushNamed(
                    routeRemoteWorkDetails,
                    arguments: _remoteWorks[index],
                  ),
                ),
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 8.0,
              );
            },
            itemCount: _remoteWorks != null ? _remoteWorks.length : 0),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    /// In case [_remoteWorks] is null then fetch if again
    if (_remoteWorks == null || _remoteWorks.isEmpty) {
      bloc.geRemoteWork();
    }
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is RemoteWorkResultStream) {
      /// Updates faqs list on the provider
      Provider.of<RemoteWorkProvider>(context, listen: false)
          .setRemoteWork(result.model);

      /// Updates videos list
      _remoteWorks = result.model;
    }
  }
}
