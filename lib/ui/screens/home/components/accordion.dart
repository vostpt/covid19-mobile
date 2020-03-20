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
  const Accordion({
    Key key,
    this.title,
    this.children,
    this.onExpansionChanged,
    this.initiallyExpanded = false,
  }) : super(key: key);

  final String title;
  final bool initiallyExpanded;
  final List<Widget> children;
  final Function(bool) onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    assert(title != null, 'Title cannot be null');

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: ListTileTheme(
          contentPadding: EdgeInsets.zero,
          iconColor: Theme.of(context).primaryColor,
          child: ExpansionTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.display4,
            ),
            initiallyExpanded: initiallyExpanded,
            onExpansionChanged: onExpansionChanged,
            children: children
                ?.map(
                  (child) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: child,
                  ),
                )
                ?.toList(),
          ),
        ),
      ),
    );
  }
}
