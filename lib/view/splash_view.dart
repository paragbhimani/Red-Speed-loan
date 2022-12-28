import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';
import 'package:lone_counter/utils/routes.dart';
import 'package:lone_counter/utils/share_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final InternetConnectivity internetConnectivity = Get.find<InternetConnectivity>();
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();

  @override
  void initState() {
    super.initState();
    print('initState');
    AppSharedPreference.clear;
    appOpenAdManager.loadAd();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        appOpenAdManager.showAdIfAvailable();
        Get.offNamed(Routes.homeView);
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset(
      "assets/splash_screen.gif",
      fit: BoxFit.fitWidth,
    )));
  }
}
