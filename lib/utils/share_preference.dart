import 'package:get_storage/get_storage.dart';

class AppSharedPreference {
  static final _getStorage = GetStorage();
  static const id = 'id';

  static Future<void> setValue(List<dynamic> value) async =>
      _getStorage.write(id, value);
  static List<dynamic> get value => _getStorage.read(id) ?? [];
  static final clear = _getStorage.erase();
  static final clearId = _getStorage.remove(id);
}
