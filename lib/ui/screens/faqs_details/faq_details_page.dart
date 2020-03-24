import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/model/faq_model.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/screens/home/components/accordion.dart';
import 'package:covid19mobile/ui/widgets/separator.dart';
import 'package:covid19mobile/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class FaqsDetails extends StatefulWidget {
  /// Faqs page view
  FaqsDetails({Key key, this.title, this.faqs}) : super(key: key);

  /// Title of the page view
  final String title;

  final List<FaqModel> faqs;

  @override
  _FaqsPageState createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsDetails> {
  /// ScrollController for changing the scroll position
  final ScrollController scrollController = ScrollController();

  /// Store the rows index key for calculating the height dynamically
  Map<int, GlobalKey> expands = <int, GlobalKey>{};

  /// Gets the top value from the element position - 1
  _getSize(int index) {
    var from = index - 1;

    var totalSize = 0.0;
    for (int i = from, j = 0; i >= j; i--) {
      /// Gets the widget key
      var gKey = expands[i];

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

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          widget.title.toUpperCase(),
          style: TextStyles.h2(color: Covid19Colors.darkGreyLight),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Scrollbar(
        child: Container(
          child: ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) {
                expands.putIfAbsent(index, () => GlobalKey());

                return Container(
                  padding: EdgeInsets.only(top: 16, bottom: 18, left: 12),
                  child: Accordion(
                    key: expands[index],
                    withBorder: false,
                    title: widget.faqs[index].question,
                    titleTextStyle: Theme.of(context).textTheme.display3.copyWith(color: Covid19Colors.green, letterSpacing: 0.2),
                    onExpansionChanged: (value) {
                      if (value && index > 0) {
                        /// Calculates the height to scroll to position
                        var size = _getSize(index);
                        scrollController.animateTo(size, duration: Duration(milliseconds: 1250), curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    children: <Widget>[
                      Html(
                        data: widget.faqs[index].answer.replaceAll("\\n", ""),
                        backgroundColor: Colors.white,
                        onLinkTap: launchURL,
                        defaultTextStyle: Theme.of(context).textTheme.body1,
                        linkStyle: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).primaryColor),
                        customTextStyle: (dom.Node node, TextStyle baseStyle) {
                          if (node is dom.Element) {
                            switch (node.localName) {
                              case "b":
                                return TextStyles.subtitle(
                                  color: Covid19Colors.darkGrey,
                                );
                            }
                          }
                          return baseStyle;
                        },
                      ),
                      Text.rich(TextSpan(
                        text: '${S.of(context).faqPageResponsableEntity}: ',
                        style: TextStyles.h3(),
                        children: <InlineSpan>[
                          TextSpan(
                            text: "${widget.faqs[index].responsableEntity}",
                            style: TextStyles.texCustom(size: 16).copyWith(fontWeight: FontWeight.w100),
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
              itemCount: widget.faqs != null ? widget.faqs.length : 0),
        ),
      ),
    );
  }
}
