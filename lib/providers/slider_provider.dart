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

import 'package:covid19mobile/model/slider_model.dart';
import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  List<SliderModel> _slider;

  List<SliderModel> get slider => _slider;

  void setSlider(List<SliderModel> values) {
    if (values == null) {
      return;
    }
    _slider = values;

    /// Sort Slides by order
    _slider.sort((s1, s2) => s1.order.toInt().compareTo(s2.order.toInt()));

    notifyListeners();
  }
}
