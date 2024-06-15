import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/model/user_model.dart';
import 'package:taxi_calculate/src/repository/authentication_repository/authentication_repository.dart';
import 'package:taxi_calculate/src/repository/user_repository/user_repository.dart';

import '../view/forget_password/forget_password_otp/otp_screen.dart';


class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  final fullName= TextEditingController();
  final email =TextEditingController();
  final phoneNo =TextEditingController(text: '+971');
  final password =TextEditingController();
  final userRepo = Get.put(UserRepository());

  Future<void> registerUser(String email , String password, UserModel user,isLogin) async {
    await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    SignUpController.instance.createUser(user,isLogin);
  }
  void createUser(UserModel user,bool isLogin)async{
    phoneAuthentication(user.phoneNo);
    Get.to(()=> OtpScreen(user: user, isLogin: isLogin,));
  }
  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}