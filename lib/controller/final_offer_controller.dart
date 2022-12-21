import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lone_counter/utils/share_preference.dart';

class FinalOfferController extends GetxController {
  bool isShow = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("clear");
    AppSharedPreference.clear;
    AppSharedPreference.clearId;
  }
}
