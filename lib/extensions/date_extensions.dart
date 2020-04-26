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

import 'package:flutter/material.dart';
import 'package:covid19mobile/extensions/string_extensions.dart';
import 'package:intl/intl.dart';
import 'package:covid19mobile/generated/l10n.dart';

extension DateTimeExtensions on DateTime {
  /// Parse date to reader friendly format
  /// ex.: [Última atualização: 11 de Abril de 2020, 20:30]
  String parseReadableLastUpdatedAtDate(BuildContext context) {
    String month = DateFormat.MMMM('pt_PT').format(this);

    String lastUpdated = S.of(context).lastUpdated;
    String of = S.of(context).dateOf;

    var hour = DateFormat('HH:mm').format(this);

    return "$lastUpdated: $day $of ${month.capitalize()} $of $year, $hour";
  }
}
