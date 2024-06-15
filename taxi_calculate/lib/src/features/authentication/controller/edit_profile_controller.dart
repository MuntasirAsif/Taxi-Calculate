import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/model/user_model.dart';
import 'package:taxi_calculate/src/repository/user_repository/user_repository.dart';



class EditProfileController extends GetxController{
  static EditProfileController get instance => Get.find();

  final fullName= TextEditingController();
  final email =TextEditingController();
  final phoneNo =TextEditingController();
  final password =TextEditingController();
  final userRepo = Get.put(UserRepository());


  void updateUser(UserModel user)async{
    userRepo.updateUser(user);
  }
}