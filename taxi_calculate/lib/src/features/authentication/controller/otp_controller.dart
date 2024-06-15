import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/model/user_model.dart';
import 'package:taxi_calculate/src/features/authentication/view/bottom_bar/bottom_bar.dart';
import 'package:taxi_calculate/src/features/authentication/view/edit_profile/edit_profile.dart';
import 'package:taxi_calculate/src/features/authentication/view/home_screen/home_screen.dart';
import 'package:taxi_calculate/src/repository/authentication_repository/authentication_repository.dart';
import 'package:taxi_calculate/src/repository/user_repository/user_repository.dart';

class OTPController extends GetxController{
  static OTPController get instance=> Get.find();

  final userRepo = Get.put(UserRepository());

  void verifyOTP(String otp, UserModel user,bool isLogin)async{
    var isVerified= await AuthenticationRepository.instance.verifyOTP(otp);
    isLogin? print('Login') : await userRepo.createUser(user);
    if(isLogin){
      isVerified? Get.to(()=>const EditProfile()): Get.back();
    }else{
      isVerified? Get.to(()=>const BottomBar()): Get.back();
    }
  }
}