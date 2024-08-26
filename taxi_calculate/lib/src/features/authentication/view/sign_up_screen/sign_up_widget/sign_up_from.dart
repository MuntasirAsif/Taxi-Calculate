import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/controller/sign_up_controller.dart';
import 'package:taxi_calculate/src/features/authentication/model/user_model.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpFromWidget extends StatelessWidget {
  const SignUpFromWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding * 0.5),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.fullName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(name), prefixIcon: Icon(CupertinoIcons.person)),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextFormField(
              controller: controller.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(email), prefixIcon: Icon(CupertinoIcons.mail)),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextFormField(
              controller: controller.phoneNo,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(phoneNumber),
                  prefixIcon: Icon(CupertinoIcons.phone)),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            TextFormField(
              controller: controller.password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              decoration: const InputDecoration(
                  label: Text(password), prefixIcon: Icon(CupertinoIcons.lock)),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            SizedBox(
                width: double.infinity,
                height: Get.height * 0.05,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        /*final user = UserModel(
                            fullName: controller.fullName.text.trim(),
                            email: controller.email.text.trim(),
                            phoneNo: controller.phoneNo.text.trim(),
                          profileImageUrl: '',
                            //password: controller.password.text.trim()
                      );*/
                        final user = UserModel(
                            fullName: controller.fullName.text.trim(),
                            email: controller.email.text.trim(),
                            phoneNo: controller.phoneNo.text.trim(),
                            profileImageUrl: '',
                            password: controller.password.text.trim());
                        SignUpController.instance.createUser(user);
                        SignUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim(),user);
                      }
                    },
                    child: Text(
                      signUp.toUpperCase(),
                    ))),
          ],
        ),
      ),
    );
  }
}
