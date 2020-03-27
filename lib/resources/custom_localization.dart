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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LicensesPageTitleTextLocal extends DefaultMaterialLocalizations {
  final BuildContext context;

  LicensesPageTitleTextLocal(Locale locale, this.context) : super();

  @override
  String get licensesPageTitle => "Licenças Open-Source";
}

class LicensesPageTitleTextLocalDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  final BuildContext context;

  const LicensesPageTitleTextLocalDelegate(this.context);

  @override
  Future<LicensesPageTitleTextLocal> load(Locale locale) =>
      SynchronousFuture(LicensesPageTitleTextLocal(locale, context));

  @override
  bool shouldReload(LicensesPageTitleTextLocalDelegate old) => false;

  @override
  bool isSupported(Locale locale) => true;
}
