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

import 'package:covid19mobile/bloc/app_bloc.dart';
import 'package:covid19mobile/bloc/base_bloc.dart';
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/model/measure_model.dart';
import 'package:covid19mobile/providers/measure_provider.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/resources/style/themes.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/widgets/card_border_arrow.dart';
import 'package:covid19mobile/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  int sortMeasures(MeasureModel a, MeasureModel b) {
    /*
     * The topIds matches the first measures to show, "trabalhadores", 
     * "empresas" and "serviços publicos" the others measures are sorted alphabetically
     * We will return -1 if the value of a is ordered before b and 1 if the value  a is ordered after b
     */
    var topIds = [69, 148, 129];
    for (var value in topIds) {
      if (value == a.id) {
        return -1;
      } else if (value == b.id) {
        return 1;
      }
    }

    return a.postTitle.compareTo(b.postTitle);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MeasuresProvider>(context);
    logger.i('[MeasuresProvider] $provider');

    if (provider.measures != null) {
      measures = provider.measures;
      measures.sort(sortMeasures);
    }

    /// Check if have any data to present, if not show [CircularProgressIndicator]
    /// while wait for data
    var hasData = measures != null && measures.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          S.of(context).measuresPageMeasures.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Covid19Colors.darkGrey),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: hasData
            ? ListView.separated(
                itemCount: measures.length,
                itemBuilder: (_, index) {
                  return CardBorderArrow(
                    text: measures[index].postTitle,
                    color:
                        index < 3 ? Covid19Colors.green : Covid19Colors.white,
                    callback: () {
                      if (measures != null) {
                        Navigator.of(context).pushNamed(
                          routeMeasuresDetails,
                          arguments: measures[index],
                        );
                      }
                    },
                    textColor:
                        index < 3 ? Covid19Colors.white : Themes.colorPrimary,
                  );
                },
                separatorBuilder: (_, __) {
                  return Container(
                    height: 10,
                  );
                },
              )
            : const Loading(),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    /// Get Measures
    ///

    var provider = Provider.of<MeasuresProvider>(context);

    if (provider.measures == null ||
        (provider.measures != null && provider.measures.isEmpty)) {
      bloc.getMeasures();
    }
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
