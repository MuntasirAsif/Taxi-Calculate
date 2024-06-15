import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taxi_calculate/src/features/authentication/controller/calculate_controller.dart';
import 'package:taxi_calculate/src/features/authentication/model/calculate_model.dart';
import 'package:taxi_calculate/src/features/authentication/view/bottom_bar/bottom_bar.dart';

class CalculateRepository extends GetxController {
  static CalculateRepository get instance => Get.find();
  final dateFormat = Get.put(CalculateController());
  final _db = FirebaseFirestore.instance;

  Future<void> uploadCalculate(CalculateModel calculation) async {
    DateTime now = DateTime.now();
    DateFormat monthFormat = DateFormat('MM : yyyy MMMM');
    String monthName = monthFormat.format(now);
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String uid = currentUser.uid;
        await _db
            .collection('Calculation')
            .doc(monthName).collection("month").doc(uid).collection('date').doc(dateFormat.formattedDate)
            .set(calculation.toJson())
            .whenComplete(() {
          Get.snackbar(
            "Success",
            "Your calculation has been saved",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green.withOpacity(0.6),
            colorText: Colors.black,
          );
          Get.to(()=>const BottomBar());
        });
      }
    } catch (error) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.6),
        colorText: Colors.black,
      );
      if (kDebugMode) {
        print("Error creating user: $error");
      }
    }
  }

  Future<List<String>> getMonths(String uid) async {
    List<String> months = [];
    try {
      var monthsSnapshot = await FirebaseFirestore.instance
          .collection('Calculation')
          .doc(uid)
          .collection('month')
          .get();
      months = monthsSnapshot.docs.map((doc) => doc.id).toList();
      print(months);
    } catch (e) {
      print('Error fetching months: $e');
    }
    return months;
  }
}