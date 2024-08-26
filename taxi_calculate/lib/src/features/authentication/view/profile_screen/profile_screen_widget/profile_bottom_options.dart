import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/view/about_us/about_us.dart';
import 'package:taxi_calculate/src/features/authentication/view/contact_us/contact_us.dart';
import 'package:taxi_calculate/src/features/authentication/view/edit_profile/edit_profile.dart';
import 'package:taxi_calculate/src/features/authentication/view/forget_password/forget_password_mail/forget_password_mail_screen.dart';
import 'package:taxi_calculate/src/features/authentication/view/your_calculation/your_calculation.dart';
import 'package:taxi_calculate/src/repository/authentication_repository/authentication_repository.dart';
import '../../../../../common_widgets/button_widget/button_widget.dart';
import '../../../../../constants/text_strings.dart';

class ProfileBottomOptions extends StatelessWidget {
  const ProfileBottomOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Get.to(()=>const EditProfile());
            },
            child: ButtonWidget(
                height: Get.height * 0.06,
                width: Get.width,
                buttonName: editProfile,
                buttonNameFontSize: 20),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          InkWell(
            onTap: (){
              Get.to(()=>const YourCalculation());
            },
            child: ButtonWidget(
                height: Get.height * 0.06,
                width: Get.width,
                buttonName: yourCalculation,
                buttonNameFontSize: 20),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          /*ButtonWidget(
              height: Get.height * 0.06,
              width: Get.width,
              buttonName: changePassword,
              buttonNameFontSize: 20),
          SizedBox(
            height: Get.height * 0.01,
          ),*/
          InkWell(
            onTap: (){
              Get.to(()=>AboutUs());
            },
            child: ButtonWidget(
                height: Get.height * 0.06,
                width: Get.width,
                buttonName: aboutUs,
                buttonNameFontSize: 20),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          InkWell(
            onTap: (){
              Get.to(()=>const ContactUs());
            },
            child: ButtonWidget(
                height: Get.height * 0.06,
                width: Get.width,
                buttonName: contactUs,
                buttonNameFontSize: 20),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          InkWell(
            onTap: (){
              Get.to(()=> ForgetPasswordMailScreen());
            },
            child: ButtonWidget(
                height: Get.height * 0.06,
                width: Get.width,
                buttonName: forgetPassword,
                buttonNameFontSize: 20),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          InkWell(
            onTap: (){
              AuthenticationRepository().logOut();
            },
            child: ButtonWidget(
                height: Get.height * 0.06,
                width: Get.width,
                buttonName: logOut,
                buttonNameFontSize: 20),
          ),
        ],
      ),
    );
  }
}
