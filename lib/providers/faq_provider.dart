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

import 'package:covid19mobile/model/faq_model.dart';
import 'package:flutter/material.dart';

class FaqProvider extends ChangeNotifier {
  final Map<int, List<FaqModel>> _faqs = <int, List<FaqModel>>{};

  Map<int, List<FaqModel>> get faqs => _faqs;

  void setFaqs(Map<int, List<FaqModel>> values) {
    if(values == null) {
      return;
    }
    _faqs.clear();
    _faqs.addAll(values);
    notifyListeners();
  }
}
