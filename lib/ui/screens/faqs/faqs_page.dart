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
import 'package:covid19mobile/model/faq_category_model.dart';
import 'package:covid19mobile/model/faq_model.dart';
import 'package:covid19mobile/providers/faq_category_provider.dart';
import 'package:covid19mobile/providers/faq_provider.dart';
import 'package:covid19mobile/resources/constants.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/widgets/card_border_arrow.dart';
import 'package:covid19mobile/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app.dart';

/// Creates an MeasuresPage extending [BasePage]
/// that is a StatefulWidget
class FaqsPage extends BasePage {
  /// Measures page view
  FaqsPage({Key key, this.title}) : super(key: key);

  /// Title of the page view
  final String title;

  @override
  _FaqsPageState createState() => _FaqsPageState();
}

class _FaqsPageState extends BaseState<FaqsPage, AppBloc> {
  List<FaqCategoryModel> faqsCategories;
  Map<int, List<FaqModel>> faqs;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FaqCategoryProvider>(context);
    var faqsProvider = Provider.of<FaqProvider>(context);
    logger.i('[FaqCategoryProvider] $provider');

    if (provider.faqs != null) {
      faqsCategories = provider.faqs;
    }
    if (faqsProvider.faqs != null) {
      faqs = faqsProvider.faqs;
    }

    /// Check if have any data to present, if not show [CircularProgressIndicator]
    /// while wait for data
    var hasData = faqsCategories != null &&
        faqsCategories.length > 0 &&
        faqs != null &&
        faqs.isNotEmpty;

    print(hasData);
    print(faqsCategories);
    print(faqs);

    return Scaffold(
      appBar: AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          S.of(context).faqPageTitle.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: Covid19Colors.darkGrey),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: hasData
            ? ListView.separated(
                itemBuilder: (context, index) => CardBorderArrow(
                      text: faqsCategories[index].name,
                      textColor: Theme.of(context).primaryColor,
                      borderColor: Theme.of(context).primaryColor,
                      callback: () {
                        logger.i(
                            "Id: ${faqsCategories[index].categoryId}. Map: $faqs; specific: ${faqs[faqsCategories[index].categoryId]}");
                        Navigator.of(context).pushNamed(routeFaqsDetails,
                            arguments: faqs[faqsCategories[index].categoryId]);
                      },
                    ),
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    height: 8.0,
                  );
                },
                itemCount: faqsCategories != null ? faqsCategories.length : 0)
            : const Loading(),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    /// Get Faqs & Faqs categories
    ///

    var provider = Provider.of<FaqCategoryProvider>(context);
    var faqsProvider = Provider.of<FaqProvider>(context);

    if ((provider.faqs == null ||
            (provider.faqs != null && provider.faqs.length == 0)) ||
        (faqsProvider.faqs == null ||
            (faqsProvider.faqs != null && faqsProvider.faqs.length == 0))) {
      bloc.getFaqCategories();
    }
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    logger.i("New data: ${result.runtimeType}");
    if (result is FaqCategoryResultStream) {
      Provider.of<FaqCategoryProvider>(context, listen: false)
          .setFaqsCategories(result.model);
    }

    if (result is FaqResultStream) {
      Provider.of<FaqProvider>(context, listen: false).setFaqs(result.model);
    }
  }
}
