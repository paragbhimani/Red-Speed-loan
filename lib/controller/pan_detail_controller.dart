import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';

class PanDetailController extends GetxController{
TextEditingController panController = TextEditingController();
String? panError;

void validator (){
  Pattern pattern = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
  RegExp regex = RegExp(pattern.toString());

  panError = (!regex.hasMatch(panController.text.toUpperCase()))
      ? "Please Enter Valid PanCard Number"
      : null;
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