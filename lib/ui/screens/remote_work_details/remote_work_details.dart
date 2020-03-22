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

import 'package:covid19mobile/model/remote_work_model.dart';
import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class RemoteWorkDetails extends StatelessWidget {
  const RemoteWorkDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RemoteWorkModel remoteWork =
        ModalRoute.of(context).settings.arguments as RemoteWorkModel;

    return Scaffold(
      appBar: AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: Covid19Colors.darkGrey),
        title: Text(
          remoteWork.postTitle.toUpperCase(),
          style: TextStyles.h2(color: Covid19Colors.darkGreyLight),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Html(
            data: remoteWork.description.replaceAll("\\n", ""),
            backgroundColor: Colors.white,
            defaultTextStyle: Theme.of(context).textTheme.body1,
            linkStyle: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: Theme.of(context).primaryColor),
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
        ),
      ),
    );
  }
}
