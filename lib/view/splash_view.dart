import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lone_counter/helper/network_helper.dart';
import 'package:lone_counter/servics/ad_mob_services.dart';
import 'package:lone_counter/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with WidgetsBindingObserver {
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    print('initState');
    WidgetsBinding.instance.addObserver(this);
    appOpenAdManager.loadAd();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offNamed(Routes.homeView);
        appOpenAdManager.showAdIfAvailable();
      },
    );
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
      print("Resumed==========================");
    if (state == AppLifecycleState.paused) {
      isPaused = true;
    }
    if (state == AppLifecycleState.resumed && isPaused) {
      appOpenAdManager.showAdIfAvailable();
      isPaused = false;
    }
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
