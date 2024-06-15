import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taxi_calculate/src/constants/colors.dart';
import 'package:taxi_calculate/src/features/authentication/controller/on_boarding_screen_controller.dart';
import 'package:taxi_calculate/src/repository/authentication_repository/authentication_repository.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final oBController = OnBoardingScreenController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: oBController.pages,
            liquidController: oBController.controller,
            onPageChangeCallback: oBController.onPageChangeCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
              bottom: Get.height * 0.06,
              child: OutlinedButton(
                onPressed: () {
                  oBController.animateToNextSlide();
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: blackColor.withOpacity(0.2)),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: blackColor, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: whiteColor,
                  ),
                ),
              )),
          Positioned(
              top: Get.height * 0.05,
              right: Get.width * 0.03,
              child: TextButton(
                onPressed: () {
                  Get.put(AuthenticationRepository());
                },
                child: Text(
                  'Skip',
                  style: textTheme.bodyMedium,
                ),
              )),
          Obx(
            () => Positioned(
              bottom: Get.height * 0.03,
              child: AnimatedSmoothIndicator(
                activeIndex: oBController.currentPage.value,
                count: oBController.pages.length,
                effect: const WormEffect(
                    activeDotColor: primaryColor, dotHeight: 6),
              ),
            ),
          )
        ],
      ),
    );
  }
}
