import 'package:covid19mobile/bloc/app_bloc.dart';
import 'package:covid19mobile/bloc/base_bloc.dart';
import 'package:covid19mobile/model/faq_model.dart';
import 'package:covid19mobile/providers/faq_provider.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/core/base_stream_service_screen_page.dart';
import 'package:covid19mobile/ui/widgets/card_faq.dart';
import 'package:covid19mobile/ui/widgets/separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FaqsPage extends BasePage {
  /// Faqs page view
  FaqsPage({Key key, this.title, this.faqs}) : super(key: key);

  /// Title of the page view
  final String title;

  final List<FaqModel> faqs;

  @override
  _FaqsPageState createState() => _FaqsPageState();

  @override
  Widget get builder => MultiProvider(providers: [
        ChangeNotifierProvider<FaqProvider>.value(value: FaqProvider()),
      ], child: FaqsPage(title: title, faqs: faqs));
}

class _FaqsPageState extends BaseState<FaqsPage, AppBloc> {
  @override
  Widget build(BuildContext context) {
    print(widget.faqs);
    var faqs = Provider.of<FaqProvider>(context);
    if(faqs.faqs.length == 0) {
      bloc.getFaqs();
    }

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
        child: ListView.separated(
            itemBuilder: (context, index) {

              var data = faqs.faqs;

              return Container(
                  padding: EdgeInsets.only(top: 16, bottom: 18, left: 12),
                  child: Text(data[index].question));
            },
            separatorBuilder: (_, __) {
              return ListSeparator(color: Covid19Colors.lightGreyLight,);
            },
            itemCount: faqs.faqs.length
        ),
      ),
    );
  }

  @override
  void initBloc(AppBloc bloc) {
    print(widget.faqs);
    if (widget.faqs == null) {
      bloc.getFaqs();
    }
    else {
      Provider.of<FaqProvider>(context, listen: false).setFaqs(widget.faqs);
    }
  }

  @override
  Stream<ResultStream> get onStateListener => bloc.onListener;

  @override
  void onStateResultListener(ResultStream result) {
    if (result is FaqResultStream) {
      Provider.of<FaqProvider>(context, listen: false).setFaqs(result.model);
    }
  }
}
