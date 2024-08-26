import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/controller/sign_in_controller.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../forget_password/forget_password_options/forget_password_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(SignInController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.mail),
                labelText: email,
                hintText: email,
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Obx(() => TextFormField(
              controller: controller.password,
              obscureText: controller.isPasswordHidden.value,
              decoration: InputDecoration(
                labelText: password,
                hintText: password,
                prefixIcon: const Icon(CupertinoIcons.lock),
                suffixIcon: IconButton(
                  icon: Icon(controller.isPasswordHidden.value
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),
            )),
            SizedBox(
              height: Get.height * 0.01,
            ),

            // Forget password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowBottomSheet(textTheme);
                },
                child: const Text(forgotPassword),
              ),
            ),

            // Login button
            SizedBox(
              width: double.infinity,
              height: Get.height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    controller.signInUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );
                  }
                },
                child: Text(login.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
