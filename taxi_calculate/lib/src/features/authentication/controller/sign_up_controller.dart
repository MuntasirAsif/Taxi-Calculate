import 'package:firebase_auth/firebase_auth.dart';
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
  final phoneNo =TextEditingController();
  final password =TextEditingController();
  final userRepo = Get.put(UserRepository());


  Future<void> registerUser(String email, String password, UserModel user) async {
    try {
      // Attempt to create the user with email and password
      await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);

      // If successful, create the user in your database
      SignUpController.instance.createUser(user);

      // Optionally, show a success message
      Get.snackbar("Success", "User registered successfully!");

    } on FirebaseAuthException catch (e) {
      // If FirebaseAuthException occurs, show the error message from Firebase
      Get.snackbar("Registration Error", e.message ?? "An unknown error occurred.");
    } catch (e) {
      // If any other exception occurs, show a generic error message
      Get.snackbar("Registration Error", "An error occurred: ${e.toString()}");
    }
  }

  void createUser(UserModel user)async{
    userRepo.createUser(user);
  }
/*void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }*/
}