import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taxi_calculate/src/features/authentication/view/history_screen/history_screen.dart';
import 'package:taxi_calculate/src/features/authentication/view/profile_screen/profile_screen.dart';
import '../view/home_screen/home_screen.dart';

class BottomBarController extends GetxController{
  static BottomBarController get instance => Get.find();
  RxInt selectedIndex = 0.obs;

  final List<Widget> selectedWidget=[
    const HomeScreen(),
    const HistoryScreen(),
    const ProfileScreen()
  ];
  void onItemTapped(int index) {
      selectedIndex.value = index;
  }
}