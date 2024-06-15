import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/model/user_model.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controller/sign_up_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding * 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login with',style: textTheme.titleSmall,),
            Text('Phone Number',style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),),
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
                prefixIcon: Icon(CupertinoIcons.phone),
                labelText: phoneNumber,
                hintText: phoneNumber,
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            /*TextFormField(
              decoration: const InputDecoration(
                labelText: password,
                hintText: password,
                prefixIcon: Icon(CupertinoIcons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),*/

            //forget password
            /*Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowBottomSheet(textTheme);
                },
                child: const Text(forgotPassword),
              ),
            ),*/

            //footer part
            SizedBox(
              width: double.infinity,
              height: Get.height * 0.05,
              child: ElevatedButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print(controller.phoneNo.text.trim());
                    }
                    if (formKey.currentState!.validate()) {
                      final user = UserModel(
                        fullName: '',
                        email: '',
                        phoneNo: controller.phoneNo.text.trim(), profileImageUrl: '',
                      );
                      SignUpController.instance.createUser(user,true);


                      /*SignUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim(),user);*/
                    }

                  }, child: Text(login.toUpperCase())),
            ),
          ],
        ),
      ),
    );
  }
}
