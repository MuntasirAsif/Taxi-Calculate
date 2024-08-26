import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/common_widgets/form_header_widget/form_header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  ForgetPasswordMailScreen({super.key});

  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                SizedBox(height: Get.height * .1),
                const FormHeaderWidget(
                  image: forgetPasswordImage,
                  title: forgetPassword,
                  subtitle: resetViaEmail,
                ),
                SizedBox(height: Get.height * .05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding * 0.5),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            label: Text(email),
                            hintText: email,
                            prefixIcon: Icon(CupertinoIcons.mail),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: Get.height * .03),
                        SizedBox(
                          width: double.infinity,
                          height: Get.height * .06,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _resetPassword(context);
                              }
                            },
                            child: Text(
                              next,
                              style: textTheme.titleMedium,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      _showMailCheckDialog();
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void _showMailCheckDialog() {
    Get.defaultDialog(
      title: "Check Your Email",
      content: Text(
        "A password reset link has been sent to ${_emailController.text.trim()}. Please check your email.",
        textAlign: TextAlign.center,
      ),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back(); // Close the dialog
        },
        child: Text("OK"),
      ),
    );
  }
}
