import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class BannerAddWidget extends StatefulWidget {
  const BannerAddWidget({
    super.key,
  });

  @override
  State<BannerAddWidget> createState() => _BannerAddWidgetState();
}

class _BannerAddWidgetState extends State<BannerAddWidget> {
  bool isBannerLoaded = false;
  late BannerAd bannerAdd;
  initializeBannerAd() async{
    bannerAdd = BannerAd(size: AdSize.banner,
        adUnitId: 'ca-app-pub-3605548896631296/4670975111',
        listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              isBannerLoaded = true;
            });
          },
          onAdFailedToLoad: (ad,error){
            ad.dispose();
            isBannerLoaded = false;
            print(error);
        }
        ),
        request: AdRequest());
    bannerAdd.load();
  }
  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      initializeBannerAd();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.15,
      child: isBannerLoaded ? AdWidget(ad: bannerAdd):const SizedBox(),
    );
  }
}