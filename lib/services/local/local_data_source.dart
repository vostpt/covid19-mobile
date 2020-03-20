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

import 'package:covid19mobile/ui/app.dart';
import 'package:hive/hive.dart';

class AppLocalDataSource {

  AppLocalDataSource();

  register<T>(TypeAdapter<T> adapter) {
    logger.i("[Adapter: $adapter] AppLocalDataSource");
    Hive.registerAdapter<T>(adapter);
  }

  Future<Box<T>> open<T>(String name) async {
    if(Hive.isBoxOpen(name)) {
      await Hive.close();
    }

    return await Hive.openBox<T>(name);
  }

}