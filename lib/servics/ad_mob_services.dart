/*
import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lone_counter/helper/ad_helper.dart';

class AdMobService {
  static InterstitialAd? interstitialAd;
  static int numInterstitialLoadAttempts = 0;
  static RewardedAd? rewardedAd;
  static int numRewardedLoadAttempts = 0;
  static int maxFailedLoadAttempts = 3;
  static RewardedInterstitialAd? rewardedInterstitialAd;
  static int numRewardedInterstitialLoadAttempts = 0;
  static AdRequest request = const AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  static void createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-3940256099942544/4411468910',
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            interstitialAd = ad;
            numInterstitialLoadAttempts = 0;
            interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            numInterstitialLoadAttempts += 1;
            interstitialAd = null;
            if (numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              createInterstitialAd();
            }
          },
        ));
  }

  static void showInterstitialAd() {
    if (interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
      },
    );
    interstitialAd!.adLoadCallback;
    interstitialAd!.show();
    interstitialAd = null;
    createInterstitialAd();
  }

  static void createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5224354917'
            : 'ca-app-pub-3940256099942544/1712485313',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            rewardedAd = ad;
            numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            rewardedAd = null;
            numRewardedLoadAttempts += 1;
            if (numRewardedLoadAttempts < maxFailedLoadAttempts) {
              createRewardedAd();
            }
          },
        ));
  }

  static void showRewardedAd() {
    if (rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createRewardedAd();
      },
    );

    rewardedAd!.setImmersiveMode(true);
    rewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    rewardedAd = null;
  }

  static void createRewardedInterstitialAd() {
    RewardedInterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5354046379'
            : 'ca-app-pub-3940256099942544/6978759866',
        request: request,
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            print('$ad loaded.');
            rewardedInterstitialAd = ad;
            numRewardedInterstitialLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedInterstitialAd failed to load: $error');
            rewardedInterstitialAd = null;
            numRewardedInterstitialLoadAttempts += 1;
            if (numRewardedInterstitialLoadAttempts < maxFailedLoadAttempts) {
              createRewardedInterstitialAd();
            }
          },
        ));
  }

  static void showRewardedInterstitialAd() {
    if (rewardedInterstitialAd == null) {
      print('Warning: attempt to show rewarded interstitial before loaded.');
      return;
    }
    rewardedInterstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
          print('$ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createRewardedInterstitialAd();
      },
      onAdFailedToShowFullScreenContent:
          (RewardedInterstitialAd ad, AdError error) {
        ad.dispose();
        createRewardedInterstitialAd();
      },
    );

    rewardedInterstitialAd!.setImmersiveMode(true);
    rewardedInterstitialAd!
        .show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {});
    rewardedInterstitialAd = null;
  }

static Future<BannerAd> bannerAd() async {
    BannerAd? adLoaded;
 await BannerAd(
    adUnitId: AdHelper.bannerAdUnitId,
    size: AdSize.banner,
    request: const AdRequest(),
    listener: BannerAdListener(
      onAdLoaded: (ad) {
        adLoaded = ad as BannerAd;

      },
      onAdFailedToLoad: (ad, error) {
        ad.dispose();
        print('Ad load failed (code=${error.code} message=${error.message})');
      },
    ),
  ).load();
  return adLoaded!;
}
}
*/
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lone_counter/utils/app_config.dart';

class AppOpenAdManager {
  AppOpenAd? appOpenAd;
  bool isShowingAd = false;
  static bool isLoaded = false;

  /// Load an AppOpenAd.
  void loadAd() {
    print('Id -----------------> ${AppConfig.appOpen.toString()}');
    AppOpenAd.load(
      adUnitId: AppConfig.appOpen.toString(),
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          print("Ad Loadede.................................");
          print(ad);
          appOpenAd = ad;
          isLoaded = true;

        },
        onAdFailedToLoad: (error) {
          print('error ------> $error');
          // Handle the error.
        },
      ),
    );
  }

  // Whether an ad is available to be shown.
  bool get isAdAvailable {
    return appOpenAd != null;
  }

  void showAdIfAvailable() {
    print(
        "Called=====================================================================");
    if (appOpenAd == null) {
      print('Tried to show ad before available.');
      loadAd();
      return;
    }
    if (isShowingAd) {
      print('Tried to show ad while already showing an ad.');
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        isShowingAd = true;
        print('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        isShowingAd = false;
        ad.dispose();
        appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        print('$ad onAdDismissedFullScreenContent');
        isShowingAd = false;
        ad.dispose();
        appOpenAd = null;
        loadAd();
      },
    );
    appOpenAd!.show();
  }


 static InterstitialAd? interstitialAd;
 static bool isInterstitialAdLoaded = false;

 static void loadInterstitial() {
    InterstitialAd.load(
      adUnitId: AppConfig.interstitialAd.toString(),
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          print("Ad Loaded");

          interstitialAd = ad;
          isInterstitialAdLoaded = true;

        },
        onAdFailedToLoad: (error) {
          print("Ad Failed to Load");
        },
      ),
    );
  }
}

class NativeSmall extends StatefulWidget {
  const NativeSmall({Key? key}) : super(key: key);

  @override
  _NativeSmallState createState() => _NativeSmallState();
}

class _NativeSmallState extends State<NativeSmall> {
  late NativeAd _adSmall;

  bool _isAdLoaded = false;


  @override
  void initState() {
    super.initState();
print('add laoded ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~> ${AppConfig.nativeId}');
    _adSmall = NativeAd(
      // Here in adUnitId: add your own ad unit ID before release build
      // adUnitId: native_id.toString(),
      adUnitId: AppConfig.nativeId.toString(),
      factoryId: 'listTileSmall',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          print("loaded ____>");
print('add laoded Id~~~~~~~~~~~> ${AppConfig.nativeId}');
          setState(() {
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {

          // Releases an ad resource when it fails to load
          ad.dispose();

          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );
    _adSmall.load();
  }

  @override
  void dispose() {
    _adSmall.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return //  small native ad template widget
      Card(
        child: _isAdLoaded
            ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: AdWidget(ad: _adSmall),
            height: 150,
            width: 400,
          ),
        )
            : const SizedBox.shrink(),
      );
  }
}

class NativeBig extends StatefulWidget {
  const NativeBig({Key? key}) : super(key: key);

  @override
  _NativeBigState createState() => _NativeBigState();
}

class _NativeBigState extends State<NativeBig> {
  late NativeAd _adMedium;
  bool _isAdLoadedMedium = false;

  @override
  void initState() {
    super.initState();

    _adMedium = NativeAd(
      // Here in adUnitId: add your own ad unit ID before release build

      adUnitId: AppConfig.nativeId.toString(),
      // adUnitId: "/6499/example/native",
      factoryId: 'listTileMedium',
      request: const AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isAdLoadedMedium = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');
        },
      ),
    );

    _adMedium.load();
  }

  @override
  void dispose() {
    _adMedium.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      //medium native ad template widget
      _isAdLoadedMedium
          ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: AdWidget(ad: _adMedium),
          height: 380,
          width: 400,
        ),
      )
          : const SizedBox.shrink();
  }
}


class CustomBannerAd extends StatefulWidget {
  const CustomBannerAd({Key? key}) : super(key: key);

  @override
  State<CustomBannerAd> createState() => _CustomBannerAdState();
}

class _CustomBannerAdState extends State<CustomBannerAd> {
  BannerAd ?bannerAd;
  bool isBannerAdLoaded = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      // adUnitId: "/6499/example/banner",
      adUnitId: AppConfig.bannerId.toString(),
      listener: BannerAdListener(onAdFailedToLoad: (ad, error) {
        print("Ad Failed to Load");
        ad.dispose();
      }, onAdLoaded: (ad) {
        print("Ad Loaded");
        setState(() {
          isBannerAdLoaded = true;
        });
      }),
      request: const AdRequest(),
    );
    bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return isBannerAdLoaded
        ? SizedBox(
      width: double.infinity,
      height: 50,
      child: AdWidget(
        ad: bannerAd!,
      ),
    )
        : SizedBox();
  }
}