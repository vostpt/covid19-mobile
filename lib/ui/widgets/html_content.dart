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

import 'package:covid19mobile/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlContent extends StatelessWidget {
  final String content;

  const HtmlContent({Key key, @required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: content,
      backgroundColor: Colors.white,
      onLinkTap: launchURL,
      defaultTextStyle: Theme.of(context).textTheme.body1,
      linkStyle: Theme.of(context)
          .textTheme
          .body1
          .copyWith(color: Theme.of(context).primaryColor),
    );
  }
}
