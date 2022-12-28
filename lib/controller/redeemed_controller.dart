import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lone_counter/helper/ad_helper.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';
import 'package:lone_counter/servics/firebase_servics.dart';

class RedeemedController extends GetxController {
  RxList data = [].obs;

  Future<void> getData() async {
    data.value = await FirebaseServices.getData();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    AppOpenAdManager.loadInterstitial();
    getData();
  }

}
