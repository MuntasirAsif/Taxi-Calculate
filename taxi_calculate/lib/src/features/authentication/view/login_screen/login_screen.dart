import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/constants/sizes.dart';
import '../../../../common_widgets/form_header_widget/form_header_widget.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import 'login_widget/login_footer_widget.dart';
import 'login_widget/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FormHeaderWidget(image: loginScreenLogo, title: loginTitle, subtitle: loginSubtitle,),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                const LoginForm(),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                LoginFooterWidget(textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

