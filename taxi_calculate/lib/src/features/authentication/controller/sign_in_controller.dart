import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taxi_calculate/src/features/authentication/model/user_model.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import '../view/forget_password/forget_password_otp/otp_screen.dart';

class SignInController extends GetxController{
  static SignInController get instance => Get.find();



  final phoneNo =TextEditingController();
  final email =TextEditingController();
  final password =TextEditingController();
  RxBool isPasswordHidden = true.obs;
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void signInUserWithPhone(String phoneNo,UserModel user,bool isLogin){
    phoneAuthentication(user.phoneNo);
    Get.to(()=> OtpScreen(user: user, isLogin: isLogin,));
  }
  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  void signInUser(String email , String password){
    AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
  }
}