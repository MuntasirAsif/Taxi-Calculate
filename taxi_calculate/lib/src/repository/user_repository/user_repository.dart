import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/model/user_model.dart';
import 'package:taxi_calculate/src/features/authentication/view/bottom_bar/bottom_bar.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String uid = currentUser.uid;
        await _db
            .collection('Users')
            .doc(uid)
            .set(user.toJson())
            .whenComplete(() {
          Get.snackbar(
            "Success",
            "Your account has been created",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          );
        });
      }
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      print("Error creating user: $error");
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String uid = currentUser.uid;
        await _db
            .collection('Users')
            .doc(uid)
            .update(user.toJson())
            .whenComplete(() {
          Get.snackbar(
            "Success",
            "Your account has been updated",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          );
          Get.to(()=>const BottomBar());
        });
      }
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      print("Error creating user: $error");
    }
  }

  Future<UserModel?> getUserDetails(String uid) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('Users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromFirestore(doc);
      } else {
        print('User not found');
        return null;
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      return null;
    }
  }
  Future<void> updateUserProfilePicture(String uid, String profileImageUrl) async {
    _db
        .collection('Users')
        .doc(uid).update({'profileImageUrl': profileImageUrl});
  }
}
