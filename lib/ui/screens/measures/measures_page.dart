///    This program is free software: you can redistribute it and/or modify
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

import 'package:covid19mobile/providers/measure_provider.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/resources/style/themes.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/widgets/card_border_arrow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid19mobile/bloc/app_bloc.dart';
import 'package:covid19mobile/bloc/base_bloc.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/model/measure_model.dart';
import '../../app.dart';

/// Creates an MeasuresPage extending [BasePage]
/// that is a StatefulWidget
class MeasuresPage extends BasePage {
  /// Measures page view
  MeasuresPage({Key key, this.title}) : super(key: key);

  /// Title of the page view
  final String title;

  @override
  _MeasuresPageState createState() => _MeasuresPageState();
}

class _MeasuresPageState extends BaseState<MeasuresPage, AppBloc> {
  List<MeasureModel> measures;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MeasuresProvider>(context);
    logger.i('[MeasuresProvider] $provider');

    if (provider.measures != null) {
      measures = provider.measures;
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          S.of(context).measuresPageMeasures.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: Covid19Colors.darkGrey),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: measures != null
          ? Container(
              margin: EdgeInsets.all(10),
              child: ListView.separated(
                itemCount: measures.length,
                itemBuilder: (_, index) {
                  return CardBorderArrow(
                    text: measures[index].postTitle,
                    callback: () {
                      if (measures != null) {
                        Navigator.of(context).pushNamed(
                          routeMeasuresDetails,
                          arguments: measures[index],
                        );
                      }
                    },
                    textColor: Themes.colorPrimary,
                  );
                },
                separatorBuilder: (_, __) {
                  return Container(
                    height: 10,
                  );
                },
              ),
            )
          : Center(
              child: Text("Loading..."),
            ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    /// Get Measures
    ///
    bloc.getMeasures();
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is MeasuresResultStream) {
      Provider.of<MeasuresProvider>(context, listen: false)
          .setMeasures(result.model);
    }
  }
}
