
import 'package:covid19mobile/ui/app.dart';
import 'package:hive/hive.dart';

import 'local/local_data_source.dart';

/// Main LocalService
///
/// This will create a singleton instance
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