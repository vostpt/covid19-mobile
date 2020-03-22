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
import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/model/faq_model.dart';
import 'package:covid19mobile/providers/faq_provider.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/screens/home/components/accordion.dart';
import 'package:covid19mobile/ui/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class FaqsPage extends BasePage {
  /// Faqs page view
  FaqsPage({Key key, this.title}) : super(key: key);

  /// Title of the page view
  final String title;

  @override
  _FaqsPageState createState() => _FaqsPageState();

  @override
  Widget get builder => MultiProvider(providers: [
        ChangeNotifierProvider<FaqProvider>.value(value: FaqProvider()),
      ], child: FaqsPage(title: title));
}

class _FaqsPageState extends BaseState<FaqsPage, AppBloc> {
  /// For the initial list of faqs
  List<FaqModel> _faqs;

  /// ScrollController for changing the scroll position
  final ScrollController scrollController = ScrollController();

  /// Store the rows index key for calculating the height dynamically
  /// Using a Key that can be changed so that on SetState will rebuild the
  /// ListView and collapse the ones that need to be collapsed
  Map<int, Key> expands = <int, Key>{};
  Map<int, GlobalKey> expandKeys = <int, GlobalKey>{};

  /// Store the rows index key for calculating the height dynamically
  Map<int, bool> isExpanded = <int, bool>{};

  /// Gets the top value from the element position - 1
  _getSize(int index) {
    var from = index - 1;

    var totalSize = 0.0;
    for (int i = from, j = 0; i >= j; i--) {
      /// Gets the widget key
      var gKey = expandKeys[i];

      /// In case the context is no longer available skip
      if (gKey.currentContext == null) {
        continue;
      }

      /// Gets the Render box to get the element size
      final RenderBox box = gKey.currentContext.findRenderObject();
      final size = box.size;

      totalSize += size.height;
    }

    return totalSize;
  }

  @override
  Widget build(BuildContext context) {
    /// TODO: in case of slow connection show loading?

    /// Gets all faqs from the Provider or the Modal Route arguments
    ///
    /// If pushing from home and faqs have initial data
    /// In case of no initial data reverts to fetch faqs
    /// and update with the Provider
    _faqs = Provider.of<FaqProvider>(context).faqs ??
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          widget.title.toUpperCase(),
          style: TextStyles.h2(color: Covid19Colors.darkGreyLight),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        child: Scrollbar(
          child: ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) {
                if(isExpanded.length != _faqs.length) {
                  isExpanded.putIfAbsent(index, () => false);
                }
                if(expandKeys.length != _faqs.length) {
                  expandKeys.putIfAbsent(index, () => GlobalKey());
                }
                if(expands.length != _faqs.length) {
                  expands.putIfAbsent(index, () => Key("${index}_${isExpanded[index]}"));
                }

                return Container(
                  key: expandKeys[index],
                  padding: EdgeInsets.only(top: 16, bottom: 18, left: 12),
                  child: Accordion(
                    key: expands[index],
                    withBorder: false,
                    initiallyExpanded: isExpanded[index],
                    title: _faqs[index].question,
                    onExpansionChanged: (value) => _onExpansionChanged(value, index),
                    children: <Widget>[
                      Text(_faqs[index].answer),
                      Text.rich(TextSpan(
                        text: '${S.of(context).faqPageResponsableEntity}: ',
                        style: TextStyles.h3(),
                        children: <InlineSpan>[
                          TextSpan(
                            text: "${_faqs[index].responsableEntity}",
                            style: TextStyles.texCustom(size: 16)
                                .copyWith(fontWeight: FontWeight.w100),
                          ),
                        ],
                      )),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return ListSeparator(
                  color: Covid19Colors.lightGreyLight,
                );
              },
              itemCount: _faqs != null ? _faqs.length : 0),
        ),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    /// In case [_faqs] is null then fetch if again
    if (_faqs == null) {
      bloc.getFaqs();
    }
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is FaqResultStream) {
      /// Updates faqs list on the provider
      Provider.of<FaqProvider>(context, listen: false).setFaqs(result.model);

      /// Updates faqs list
      _faqs = result.model;
    }
  }

  _onExpansionChanged(value, index) {

    isExpanded[index] = value;
    expands[index] = Key("${index}_${isExpanded[index]}");

    expands.forEach((i, value) {
      if(i != index) {
        if(isExpanded[i]) {
          isExpanded[i] = false;
          expands[i] = Key("${i}_${isExpanded[i]}");
        }
      }
    });
    setState(() {
      Future.delayed(Duration(milliseconds: 100), () {
        if (value && index > 0) {

          /// Calculates the height to scroll to position
          var size = _getSize(index);

          scrollController.animateTo(size,
              duration: Duration(milliseconds: 2550),
              curve: Curves.fastLinearToSlowEaseIn);
        }
      });
    });

  }
}
