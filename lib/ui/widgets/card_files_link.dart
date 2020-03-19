/*  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardFilesLink extends StatelessWidget {
  final String text;
  final String link;

  CardFilesLink(this.text, this.link);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchUrl(link);
      },
      child: Card(
        color: Colors.teal,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    text.length > 15 ? text.substring(0, 15) + "..." : text,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchUrl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Cannot launch $link';
    }
  }
}
