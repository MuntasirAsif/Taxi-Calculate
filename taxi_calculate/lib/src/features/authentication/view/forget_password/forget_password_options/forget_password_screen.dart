import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/view/forget_password/forget_password_mail/forget_password_mail_screen.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'forget_password_button_widget.dart';

class ForgetPasswordScreen{

  static Future<dynamic> buildShowBottomSheet(TextTheme textTheme) {
    bool isDark = Get.isDarkMode;
    return Get.bottomSheet(Container(
      width: double.infinity,
      height: Get.height * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDark ? blackColor:bgColor,
      ),
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            forgetPasswordTitle,
            style: textTheme.headlineMedium,
          ),
          Text(
            forgetPasswordSubtitle,
            style: textTheme.bodyMedium,
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          ForgetPasswordButtonWidget(
            buttonIcon: CupertinoIcons.mail,
            title: email,
            subTitle: resetViaEmail,
            onTap: () {
              Get.back();
              Get.to(()=> ForgetPasswordMailScreen());
            },
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          ForgetPasswordButtonWidget(
            buttonIcon: CupertinoIcons.phone,
            title: phone,
            subTitle: resetViaPhone,
            onTap: () {},
          ),
        ],
      ),
    ));
  }
}