import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';
import '../model/on_boarding_screen_model.dart';
import '../view/on_boarding_screen/onBoardingScreenWidget.dart';

class OnBoardingScreenController extends GetxController{


  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPage(
        model: OnBoardingScreenModel(required, title1, subTitle1,
            onBoardCounter1, onBoardPage1color, firstImage, Get.height)),
    OnBoardingPage(
        model: OnBoardingScreenModel(required, title2, subTitle2,
            onBoardCounter2, onBoardPage2color, secondImage, Get.height)),
    OnBoardingPage(
        model: OnBoardingScreenModel(required, title3, subTitle3,
            onBoardCounter3, onBoardPage3color, thirdImage, Get.height))
  ];

  void animateToNextSlide(){
    int nextPage = controller.currentPage+1;
    controller.animateToPage(page: nextPage);
  }

  void onPageChangeCallback(int activePageIndex){
    currentPage.value = activePageIndex;
  }
}