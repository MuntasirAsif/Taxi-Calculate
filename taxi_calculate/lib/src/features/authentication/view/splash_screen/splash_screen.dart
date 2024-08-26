import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:taxi_calculate/src/constants/colors.dart';
import 'package:taxi_calculate/src/constants/image_strings.dart';
import 'package:taxi_calculate/src/constants/text_strings.dart';
import 'package:taxi_calculate/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../common_widgets/fade_in_animation/animation_design.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(FadeInAnimationController());

  @override
  void initState() {
    // TODO: implement initState
    controller.find.startSplashAnimations();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FadeInAnimation(
              durationInSc: 1,
              animate: FadeInAnimationPosition(topAfter: 0,topBefore: -30,leftAfter: 0,leftBefore: -30),
              child: const SizedBox(
                height: 150,
                width: 150,
                child: Image(
                  image: AssetImage(splashScreenStarImage),
                ),
              ),
            ),
             FadeInAnimation(
               durationInSc: 1,
                animate: FadeInAnimationPosition(topBefore: 100,topAfter: 100,leftBefore: -200, leftAfter: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sSFirstText,
                      style: textTheme.headlineSmall,
                    ),
                    Text(
                      sSSecondText,
                      style: textTheme.bodyMedium!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                    Text(
                      sSThirdText,
                      style: textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            Obx(
              () => Positioned(
                  top: Get.height * 0.25,
                  child: AnimatedContainer(
                    width: controller.animate.value ? Get.width : 0,
                    height: controller.animate.value
                        ? Get.height * .5
                        : Get.height * .5,
                    duration: const Duration(seconds: 1),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(splashScreenMiddleBgImage))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          width: controller.animateIcon.value
                              ? Get.width * 0.8
                              : 0,
                          height: controller.animateIcon.value
                              ? Get.height * .25
                              : 0,
                          child: const Image(
                            image: AssetImage(splashScreenMiddleImage),
                          ),
                        ),
                        controller.animateIcon.value
                            ? Text(
                                appName,
                                style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold,color: blackColor),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  bottom: controller.animate.value ? 0 : -30,
                  right: controller.animate.value ? 0 : -30,
                  duration: const Duration(seconds: 1),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: controller.animate.value ? 150 : 50,
                    width: controller.animate.value ? 150 : 50,
                    child: const Image(
                      image: AssetImage(splashScreenBottomImage),
                    ),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(seconds: 1),
                bottom: controller.animate.value
                    ? -(Get.height * 0.25)
                    : -Get.height,
                left: controller.animate.value
                    ? -(Get.height * 0.25)
                    : -Get.height,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: Get.height * 0.5,
                  width: Get.height * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10000),
                      color: isDark?whiteShadeColor:blackColor.withOpacity(0.4)),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(seconds: 1),
                top: controller.animate.value
                    ? -(Get.width * 0.25)
                    : -(Get.width * 2),
                right: controller.animate.value
                    ? -(Get.width * 0.25)
                    : -(Get.width * 2),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: Get.width * 0.5,
                  width: Get.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10000),
                      color: primaryColor.withOpacity(0.4)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
