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

import 'package:covid19mobile/model/covid_status_model.dart';
import 'package:covid19mobile/ui/screens/statistics/model/covid_status_statistics_page.dart';
import 'package:flutter/material.dart';

class CovidStatusProvider extends ChangeNotifier {
  CovidStatusModel _status;

  CovidStatusModel get status => _status;

  CovidStatusStatistics get statistics => CovidStatusStatistics(status: status);

  void setCovidStatus(CovidStatusModel value) {
    _status = value;
    notifyListeners();
  }
}
