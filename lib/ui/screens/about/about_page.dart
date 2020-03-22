import 'package:covid19mobile/generated/l10n.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:covid19mobile/ui/assets/images.dart';
import 'package:covid19mobile/ui/widgets/card_border_arrow.dart';
import 'package:covid19mobile/utils/launch_url.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: Theme.of(context).iconTheme.copyWith(
                color: Covid19Colors.darkGrey,
              ),
          backgroundColor: Colors.white,
          title: Text(
            S.of(context).screenAboutTitle.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Covid19Colors.darkGrey),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    S.of(context).screenAboutContent1,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Covid19Colors.darkGrey),
                    textAlign: TextAlign.left,
                  ),
                  const _TextMargin(),
                  Text(
                    S.of(context).screenAboutContent2,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Covid19Colors.darkGrey),
                    textAlign: TextAlign.left,
                  ),
                  const _TextMargin(),
                  Text(
                    S.of(context).screenAboutContent3,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Covid19Colors.darkGrey),
                    textAlign: TextAlign.left,
                  ),
                  const _TextMargin(),
                  Text(
                    S.of(context).screenAboutContent4,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Covid19Colors.darkGrey),
                    textAlign: TextAlign.left,
                  ),
                  const _TextMargin(),
                  Text(
                    S.of(context).screenAboutContent5,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Covid19Colors.darkGrey),
                    textAlign: TextAlign.left,
                  ),
                  const _TextMargin(),
                  Text(
                    S.of(context).screenAboutHashtag,
                    style: Theme.of(context).textTheme.body1.copyWith(
                          color: Covid19Colors.darkGrey,
                          fontWeight: FontWeight.w900,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  const _TextMargin(),
                  Text(
                    S.of(context).screenAboutBuilt,
                    style: Theme.of(context).textTheme.body1.copyWith(
                          color: Covid19Colors.darkGrey,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  /*const SizedBox(
                    height: 22.0,
                  ),
                  CardBorderArrow(
                    text: S.of(context).screenAboutButtonReport,
                    callback: () => print("yey"),
                    textColor: Covid19Colors.darkGrey,
                    borderColor: Covid19Colors.grey,
                  ),*/
                  const _TextMargin(),
                  CardBorderArrow(
                    text: S.of(context).screenAboutButtonOpenSource,
                    callback: () => print("yey"),
                    textColor: Covid19Colors.darkGrey,
                    borderColor: Covid19Colors.grey,
                  ),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      logoRepublica,
                      color: Colors.white,
                      width: size.width * 0.4,
                    ),
                    const _FooterMargin(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _SocialMediaImage(
                          assetName: socialYoutube,
                          width: size.width * 0.125,
                          url:
                              "https://www.youtube.com/channel/UCOE-JsBcVf4__OlrsiW59EQ",
                        ),
                        const SizedBox(
                          width: 18.0,
                        ),
                        _SocialMediaImage(
                          assetName: socialTwitter,
                          width: size.width * 0.125,
                          url: "https://twitter.com/govpt",
                        ),
                      ],
                    ),
                    const _FooterMargin(),
                    Text(
                      S.of(context).screenAboutFooter1,
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            color: Covid19Colors.white,
                          ),
                      textAlign: TextAlign.left,
                    ),
                    const _TextMargin(),
                    Text(
                      S.of(context).screenAboutFooter2,
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            color: Covid19Colors.white,
                          ),
                      textAlign: TextAlign.left,
                    ),
                    const _FooterMargin(),
                    Image.asset(
                      imageCcIcons,
                      width: size.width * 0.4,
                    ),
                    const _FooterMargin(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class _TextMargin extends StatelessWidget {
  const _TextMargin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 8.0,
    );
  }
}

class _FooterMargin extends StatelessWidget {
  const _FooterMargin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 18.0,
    );
  }
}

class _SocialMediaImage extends StatelessWidget {
  final String assetName;
  final String url;
  final double width;

  const _SocialMediaImage({
    Key key,
    @required this.assetName,
    @required this.url,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchURL(url),
      child: Image.asset(
        assetName,
        width: width,
      ),
    );
  }
}
