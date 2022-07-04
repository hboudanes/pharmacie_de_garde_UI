import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../service/admob/ad_help.dart';

class HomeController extends GetxController{
  late BannerAd bottomBannerAd;
  RxBool isBottomBannerAdLoaded = false.obs;
  @override
  void onInit() {
    createBottomBannerAd();
    super.onInit();
  }
  void createBottomBannerAd() {
    bottomBannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
         
            isBottomBannerAdLoaded.value = true;
          
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    bottomBannerAd.load();
  }
}