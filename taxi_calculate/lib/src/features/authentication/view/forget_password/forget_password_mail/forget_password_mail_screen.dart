import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/common_widgets/form_header_widget/form_header_widget.dart';
import 'package:taxi_calculate/src/features/authentication/view/forget_password/forget_password_otp/otp_screen.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

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
                SizedBox(height: Get.height*.1,),
                const FormHeaderWidget(
                    image: forgetPasswordImage,
                    title: forgetPassword,
                    subtitle: resetViaEmail),
                SizedBox(height: Get.height*.05,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: defaultPadding*0.5),
                  child: Form(child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text(email),
                          hintText: email,
                          prefixIcon: Icon(CupertinoIcons.mail)
                        ),
                      ),
                      SizedBox(height: Get.height*.03,),
                      SizedBox(
                        width: double.infinity,
                        height: Get.height*.06,
                        child: ElevatedButton(onPressed: (){
                         // Get.to(()=>const OtpScreen());
                        }
                            , child: Text(next,style: textTheme.titleMedium,)),
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
