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

import 'package:cloud_firestore/cloud_firestore.dart';

class MeterologicWarningLocal {
  final String localName;

  MeterologicWarningLocal(this.localName);
}

class MeteorologicWarning {
  final String zone;
  final String level;
  final String icon;
  final String type;
  final DateTime start;
  final DateTime end;
  final List<MeterologicWarningLocal> locals;

  final DocumentReference reference;

  MeteorologicWarning.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['zone'] != null),
        assert(map['nivel'] != null),
        assert(map['icon'] != null),
        assert(map['tipo'] != null),
        assert(map['inicio'] != null),
        assert(map['fim'] != null),
        assert(map['locais'] != null),
        zone = map['zone'],
        level = map['nivel'],
        icon = map['icon'],
        type = map['tipo'],
        start = null,
        end = null,
        locals = null;
  //TODO(FB) Add missing fields start, end, locals

  MeteorologicWarning.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}

final mockedSnapshot = [
  {
    "zone": "continente",
    "nivel": "Amarelo",
    "icon": ":ocean:",
    "tipo": "Agitação Marítima",
    "inicio": "2021-02-23 18:00",
    "fim": "2021-02-24 09:00",
    "locais": [
      {"local": "GrupoCentral"}
    ]
  },
  {
    "zone": "continente",
    "nivel": "Azul",
    "icon": ":ocean:",
    "tipo": "Agitação Marítima",
    "inicio": "2021-02-20 12:00",
    "fim": "2021-02-21 10:00",
    "locais": [
      {"local": "GrupoCentral"}
    ]
  },
];
