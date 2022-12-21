import 'package:get/get.dart';
import 'package:lone_counter/utils/share_preference.dart';

class LoneStatusController extends GetxController{

List<dynamic> data = [];

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    data = AppSharedPreference.value;
  }

}