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

import 'package:covid19mobile/ui/assets/colors.dart';
import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class CardHomeSliderIndicator extends AnimatedWidget {
  CardHomeSliderIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color = Colors.white,
  }) : super(listenable: controller);

  /// The PageController for the indicator.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the indicator.
  final Color color;

  Widget _buildLineIndicator(int index) {
    return Container(
      width: 24,
      child: Center(
        child: Material(
          color: (controller.page != null && index != controller.page.toInt())
              ? Covid19Colors.grey
              : color,
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          type: MaterialType.canvas,
          child: Container(
            width: 14.0,
            height: 2.0,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildLineIndicator),
    );
  }
}
