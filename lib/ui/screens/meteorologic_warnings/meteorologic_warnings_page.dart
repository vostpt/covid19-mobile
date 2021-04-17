import 'package:covid19mobile/model/meteorologic_warnings.dart';

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

class MeteorologicWarningsPage extends StatefulWidget {
  @override
  _MeteorologicWarningsPageState createState() =>
      _MeteorologicWarningsPageState();
}

class _MeteorologicWarningsPageState extends State<MeteorologicWarningsPage> {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text("Avisos Meteorologicos"),
      ),
      body: _buildbody(context),
    );
  }

  Widget _buildbody(BuildContext context) {
    // TODO: snapshot from Cloud Firestore

    return _buildList(context, mockedSnapshot);
  }

  Widget _buildList(BuildContext context, List<Map<String, dynamic>> snapshot) {
    return ListView(
      padding: EdgeInsets.only(top: 20.0),
      children: snapshot
          .map((Map<String, dynamic> data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> data) {
    final warning = MeteorologicWarning.fromMap(data);

    return Padding(
      key: ValueKey(warning.start),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(warning.type),
          trailing: Text(warning.level),
          onTap: () => print(warning.level),
        ),
      ),
    );
  }
}
