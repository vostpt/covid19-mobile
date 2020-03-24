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
  void initState() {
    super.initState();
  }

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
        child: ListView.separated(
            itemBuilder: (context, index) => CardBorderArrow(
                  text: faqsCategories[index].name,
                  textColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  callback: () {
                    logger.i(
                        "Id: ${faqsCategories[index].id}. Map: $faqs; specific: ${faqs[faqsCategories[index].id]}");
                    Navigator.of(context).pushNamed(routeFaqsDetails,
                        arguments: faqs[faqsCategories[index].categoryId]);
                  },
                ),
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 8.0,
              );
            },
            itemCount: faqsCategories != null ? faqsCategories.length : 0),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    /// Get Measures
    ///
    bloc.getFaqCategories();
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is FaqCategoryResultStream) {
      Provider.of<FaqCategoryProvider>(context, listen: false)
          .setFaqsCategories(result.model);
    }
  }
}
