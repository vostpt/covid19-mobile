import 'package:covid19mobile/resources/style/text_styles.dart';
import 'package:flutter/material.dart';

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

class CardVideo extends StatelessWidget {
  const CardVideo({
    Key key,
    @required this.backgroundUrl,
    this.onPressed,
    this.label,
    this.labelAlignment = Alignment.bottomCenter,
  }) : super(key: key);

  final String backgroundUrl;
  final String label;
  final Alignment labelAlignment;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: onPressed,
          child: Container(
        height: 144.0,
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(18.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
            image: NetworkImage(backgroundUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: 38.0,
              height: 38.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
            ),
            ButtonTheme(
              minWidth: 0.0,
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              buttonColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: RaisedButton(
                elevation: 4.0,
                onPressed: onPressed,
                disabledColor: Colors.transparent,
                child: Icon(
                  Icons.play_circle_filled,
                  size: 48.0,
                  color: onPressed != null
                      ? Theme.of(context).textTheme.button.color
                      : Theme.of(context).disabledColor,
                ),
              ),
            ),
            if (label != null)
              Align(
                alignment: labelAlignment,
                child: Text(
                  label,
                  style:
                      TextStyles.subtitle(color: Colors.white).copyWith(shadows: [
                    const Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 3.0,
                    ),
                  ]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
