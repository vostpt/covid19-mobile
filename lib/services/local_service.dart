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

import 'local/local_data_source.dart';

/// Main LocalStorageService
///
/// This will create a singleton instance
///
/// To use add this to getRequest
/// await LocalStorageService.cache.saveToCache(cacheKey, results);
///
class LocalStorageService {
  static const String _tag = '.LocalStorageService';
  static LocalStorageService _localService = LocalStorageService._();
  static bool _initialized = false;

  static LocalStorageService get cache => _localService;

  /// To Cache data using Hive
  static final localDataSource = AppLocalDataSource();

  LocalStorageService._() {
    /// Register all Hive Models
    _registerModels();
  }

  _registerModels() {
    ///TODO: ad models here
      //localDataSource
      //..register<Model>(Adapter());
  }

  getFromCache<T>(String cacheKey) async {
    Box box = await localDataSource.open<T>(cacheKey);
    logger.i("BOX EMPTY: ${box.isEmpty}");

    if(box.isNotEmpty) {
      var values = box.values;
      return values.toList();
    }
    return null;
  }

  saveToCache<T>(String cacheKey, List<T> results) async {
    Box box = await localDataSource.open<T>(cacheKey);
    logger.i("BOX EMPTY: ${box.isEmpty}");

    /// Clear all before adding
    await box.clear();

    /// Add all to the box
    await box.addAll(results);
  }
}