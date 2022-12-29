import 'package:get/get.dart';
import 'package:lone_counter/utils/share_preference.dart';

class LoneStatusController extends GetxController{

List<dynamic> data = [];

@override
  Future<void> onInit() async {
    super.onInit();
    data = await AppSharedPreference.value;
    print('----------> $data ||| ${AppSharedPreference.value}');
    update();
  }
}