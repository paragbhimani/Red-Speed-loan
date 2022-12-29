import 'package:get_storage/get_storage.dart';

class AppSharedPreference {
  static final getStorage = GetStorage();
  static const id = 'id';

  static Future<void> setValue(List<dynamic> value) async => await getStorage.write(id, value);

  static Future<List> get value async => await getStorage.read(id);
}
