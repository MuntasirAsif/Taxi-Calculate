import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:taxi_calculate/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:taxi_calculate/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:taxi_calculate/src/constants/image_strings.dart';
import 'package:taxi_calculate/src/constants/sizes.dart';
import 'package:taxi_calculate/src/constants/text_strings.dart';
import 'package:taxi_calculate/src/features/authentication/view/login_screen/login_screen.dart';
import 'package:taxi_calculate/src/features/authentication/view/sign_up_screen/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.find.startAnimations();
    final textTheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: true,
      onPopInvoked : (didPop){
        SystemNavigator.pop();
      },
      child: Scaffold(
        body: Stack(
          children: [
            FadeInAnimation(
              durationInSc: 1,
              animate: FadeInAnimationPosition(
                bottomBefore: -100,
                bottomAfter: 0,
                topBefore: 0,
                topAfter: 0,
                leftAfter: 0,
                leftBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Image(image: AssetImage(welcomeScreenImage)),
                    Column(
                      children: [
                        Text(
                          welcome,
                          style: textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          appName,
                          style: textTheme.headlineLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          welcomeTitle,
                          style: textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          welcomeSubTitle,
                          style: textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    buttonSection(textTheme),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buttonSection(TextTheme textTheme) {
    return Row(
      children: [
        Expanded(
            child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const LoginScreen(),transition: Transition.downToUp);
                },
                child: Text(
                  login.toUpperCase(),
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ))),
        SizedBox(
          width: Get.width * 0.03,
        ),
        Expanded(
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignUpScreen(),transition: Transition.upToDown);
                },
                child: Text(signUp.toUpperCase(),
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600)))),
      ],
    );
  }
}
