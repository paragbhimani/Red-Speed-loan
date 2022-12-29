import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';

class ContactDetailController extends GetxController {
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? emailError;
  String? numberError;

  void validator() {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    emailError = (!regex.hasMatch(emailController.text))
        ? "Please Enter Valid Email"
        : null;
    numberError = contactController.text.length != 10
        ? "Please Enter Valid Phone Number"
        : null;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    AppOpenAdManager.loadInterstitial();
  }

  ///aavi rite kari nakh ne pachi haji baki chee e hu karu nakhish
  ///jamva javu chee    hve kya kai mukvani e ke
  ///bs aaj baaki chee
  ///biju thai gyu chee
  ///and aa ma api no data set karva no chee hve kya mukvanu  fourm ma dispos and init ma aakha fourm che to khrane  pachal baki chee
  ///badhe load thavu joi ok
  ///kam hoy to call karje   bdhi jagyaye to che form ma
  ///page open thay and back javi tyare
  ///memu ki hamna kyak kaik baaki chee e check kari le jaya baki chee e check kari le and muki de kai mukvani blue ave che e e ad
  @override
  void onClose() {
    super.onClose();
    print("on delete");
    AppOpenAdManager.interstitialAd?.show();
    AppOpenAdManager.loadInterstitial();
  }
}
