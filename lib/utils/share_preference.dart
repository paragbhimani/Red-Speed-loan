import 'package:get_storage/get_storage.dart';

class AppSharedPreference {
  static final getStorage = GetStorage();
  static const id = 'id';

  static void setValue(List<dynamic> value) async => getStorage.write(id, value);

  static List get value => getStorage.read(id) ?? [];
}
