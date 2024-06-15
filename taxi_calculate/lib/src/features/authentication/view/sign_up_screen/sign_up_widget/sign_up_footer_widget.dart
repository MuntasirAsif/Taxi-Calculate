import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/view/login_screen/login_screen.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding*0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('OR'),
          SizedBox(
            height: Get.height * 0.03,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Get.snackbar(
                  "Sorry!!",
                  "Will Update soon",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red.withOpacity(0.1),
                  colorText: Colors.red,
                );
              },
              icon: Image(
                image: const AssetImage(googleIcon),
                width: Get.width * 0.12,
              ),
              label: Text(
                signInWithGoogle,
                style: textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          TextButton(
              onPressed: () {
                Get.to(()=>const LoginScreen());
              },
              child: Text.rich(TextSpan(
                  text: alreadyHaveAnAccount,
                  style: textTheme.bodyLarge,
                  children: [
                    TextSpan(
                        text: login,
                        style: textTheme.bodyLarge!
                            .copyWith(color: Colors.blue))
                  ]))),
        ],
      ),
    );
  }
}