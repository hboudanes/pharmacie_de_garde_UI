import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '/service/admob/ad_help.dart';

class AdmobController extends GetxController {
  //we want to be able to check if the ad is loaded before displaying it.
  // So let’s create a variable of type bool(islargeBannerAdLoaded ) to help us out with this.
  // We will initially set it to false(false.obs). That's because at the very beginning
  // the ad won’t be loaded and we only want it to be set to true when it is.
  late BannerAd largeBannerAd;
  late BannerAd bannerAd;
  late BannerAd bannerPharmacieAd;
  InterstitialAd? interstitialAd;
  static const int maxFailedLoadAttempts = 3;
  int interstitialLoadAttempts = 0;

  RxBool isLargeBannerAdLoaded = false.obs;
  RxBool isBannerAdLoaded = false.obs;
  RxBool isBannerPharmacieAdLoade = false.obs;

  @override
  void onInit() {
    createlargeBannerAd();
    createBannerAd();
    createInterstitialAd();
    createBannerPharmacieAd();
    super.onInit();
  }

  //write a function that will create and load the banner ad for us when called.
  void createlargeBannerAd() {
    largeBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.largeBanner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isLargeBannerAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    largeBannerAd.load();
  }

  void createBannerAd() {
    bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    bannerAd.load();
  }

  void createBannerPharmacieAd() {
    bannerPharmacieAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isBannerPharmacieAdLoade.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    bannerPharmacieAd.load();
  }

  void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          interstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          interstitialLoadAttempts += 1;
          interstitialAd = null;
          if (interstitialLoadAttempts <= maxFailedLoadAttempts) {
            createInterstitialAd();
          }
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createInterstitialAd();
        },
      );
      interstitialAd!.show();
    }
  }

  @override
  void onClose() {
    largeBannerAd.dispose();
    bannerAd.dispose();
    bannerPharmacieAd.dispose();
    interstitialAd?.dispose();
    // This will ensure that we free up the resources when they are no longer needed.
    super.onClose();
  }
}
