import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/constants/sizes.dart';
import 'package:taxi_calculate/src/features/authentication/view/calculate_screen/calculate_screen.dart';
import 'package:taxi_calculate/src/features/authentication/view/home_screen/home_screen_widget/profile_section.dart';
import 'package:taxi_calculate/src/features/authentication/view/home_screen/home_screen_widget/time_section.dart';
import '../../../../common_widgets/button_widget/button_widget.dart';
import '../../../../constants/text_strings.dart';
import 'home_screen_widget/banner_add.dart';
import 'home_screen_widget/home_animated_text.dart';
import 'home_screen_widget/home_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ProfileSection(textTheme: textTheme),
                TimeSection(),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const HomeImage(),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                HomeAnimatedText(textTheme: textTheme),
                const BannerAddWidget(),
                InkWell(
                  onTap: (){
                    Get.to(()=>const CalculateScreen());
                  },
                  child: ButtonWidget(
                    height: Get.height * 0.1,
                    width: double.infinity,
                    buttonName: letsCalculate,
                    buttonNameFontSize: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

