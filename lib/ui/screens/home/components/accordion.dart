import 'package:covid19mobile/ui/widgets/border_decorator.dart';

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

import 'package:flutter/material.dart';

class Accordion extends StatelessWidget {
  const Accordion(
      {Key key,
      this.title,
      this.children,
      this.onExpansionChanged,
      this.withBorder = true,
      this.initiallyExpanded = false,
      this.titleTextStyle,
      this.padding,
      this.margin,
      this.contentPadding,
      this.childrenPadding})
      : super(key: key);

  final String title;
  final List<Widget> children;
  final Function(bool) onExpansionChanged;

  final bool initiallyExpanded;
  final bool withBorder;

  final TextStyle titleTextStyle;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry childrenPadding;

  @override
  Widget build(BuildContext context) {
    assert(title != null, 'Title cannot be null');

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 15.0),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: withBorder ? Covid19StatisticsBorderDecorator() : null,
        child: ListTileTheme(
          contentPadding: contentPadding ?? EdgeInsets.zero,
          child: ExpansionTile(
            title: Text(
              title,
              style: titleTextStyle ?? Theme.of(context).textTheme.display4,
            ),
            initiallyExpanded: initiallyExpanded,
            onExpansionChanged: onExpansionChanged,
            children: children
                ?.map(
                  (child) => Padding(
                    padding: childrenPadding ??
                        const EdgeInsets.symmetric(vertical: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: child,
                    ),
                  ),
                )
                ?.toList(),
          ),
        ),
      ),
    );
  }
}
