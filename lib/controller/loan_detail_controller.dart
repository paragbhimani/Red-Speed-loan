import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';

class LoanDetailController extends GetxController {
  TextEditingController amountController = TextEditingController();
  TextEditingController tenureController = TextEditingController();
  String? amtError;
  String? tenureError;

  void validator (){
    amtError = amountController.text.isEmpty ? "Please Enter Amount":null;
    tenureError = tenureController.text.isEmpty ? "Please Enter Tenure": int.parse(tenureController.text) < 3 ? 'Lone tenure Must Be Grater Than 2' :  null;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    AppOpenAdManager.loadInterstitial();
  }
  @override
  void onClose() {
    super.onClose();
    print("on delete");
    AppOpenAdManager.interstitialAd?.show();
    AppOpenAdManager.loadInterstitial();
  }
}
