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
import 'package:covid19mobile/generated/l10n.dart';

enum SymptomType {
  cough,
  fever,
  breathingDifficulties,
  headache,
  musclePain,
  generalizedWeakness
}

class SymptomsPercentage {
  final int order;
  final SymptomType symptom;
  final int percentage; // 0 to 100

  SymptomsPercentage({
    @required this.order,
    @required this.symptom,
    @required this.percentage,
  });
}

extension SymptomTypeExtension on SymptomType {
  /// return the string representation of the [SymptomType]
  String label(BuildContext context) => {
        SymptomType.cough: S.of(context).symptomCough,
        SymptomType.fever: S.of(context).symptomFever,
        SymptomType.breathingDifficulties:
            S.of(context).symptomBreathingDifficulties,
        SymptomType.headache: S.of(context).symptomHeadache,
        SymptomType.musclePain: S.of(context).symptomMusclePain,
        SymptomType.generalizedWeakness:
            S.of(context).symptomGenealizedWeakness,
      }[this];
}
