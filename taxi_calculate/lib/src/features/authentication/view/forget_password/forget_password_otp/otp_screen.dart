import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/common_widgets/form_header_widget/form_header_widget.dart';
import 'package:taxi_calculate/src/constants/colors.dart';
import 'package:taxi_calculate/src/constants/image_strings.dart';
import 'package:taxi_calculate/src/features/authentication/controller/otp_controller.dart';
import 'package:taxi_calculate/src/features/authentication/model/user_model.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class OtpScreen extends StatelessWidget {
  final bool isLogin;
  final UserModel user;
  const OtpScreen({super.key, required this.user, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OTPController());
    var otp;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  const FormHeaderWidget(
                      image: otpImage, title: otpTitle, subtitle: otpSubtitle),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  OtpTextField(
                    fieldWidth: Get.width * 0.11,
                    numberOfFields: 6,
                    cursorColor: blackColor,
                    focusedBorderColor: blackColor,
                    enabledBorderColor: bgColor,
                    filled: true,
                    fillColor: cardBgColor.withOpacity(.5),
                    onSubmit: (code){
                      otp=code;
                      OTPController.instance.verifyOTP(otp,user,isLogin);
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                        height: Get.height*0.05,
                        child: ElevatedButton(onPressed: (){
                          OTPController.instance.verifyOTP(otp,user,isLogin);
                        }, child: Text(next,style: textTheme.titleMedium,))),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
