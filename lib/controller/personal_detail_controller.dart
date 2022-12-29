import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';

class PersonalDetailController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
String? fNameError ;
String? lNameError ;

  void validator (){
    fNameError = firstNameController.text.isEmpty ? "Please Enter First Name":null;
    lNameError = lastNameController.text.isEmpty ? "Please Enter Last Name":null;
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
