import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';
import 'package:lone_counter/utils/share_preference.dart';

class FinalOfferController extends GetxController {
  bool isShow = false;
@override
  void onClose() {
    // TODO: implement dispose
    super.dispose();
    AppOpenAdManager.interstitialAd?.show();
    AppOpenAdManager.loadInterstitial();
  }

}
