


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