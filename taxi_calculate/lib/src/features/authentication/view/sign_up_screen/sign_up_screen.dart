import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/common_widgets/form_header_widget/form_header_widget.dart';
import 'package:taxi_calculate/src/constants/text_strings.dart';
import 'package:taxi_calculate/src/features/authentication/view/sign_up_screen/sign_up_widget/sign_up_footer_widget.dart';
import 'package:taxi_calculate/src/features/authentication/view/sign_up_screen/sign_up_widget/sign_up_from.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FormHeaderWidget(image: loginScreenLogo, title: signUpTitle, subtitle: signUpSubtitle),
                SizedBox(
                  height: Get.height*0.05,
                ),

                const SignUpFromWidget(),
                SizedBox(
                  height: Get.height*0.02,
                ),
                SignUpFooterWidget(textTheme: textTheme,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


