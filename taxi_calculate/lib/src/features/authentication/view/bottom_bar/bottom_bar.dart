import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/constants/colors.dart';
import 'package:taxi_calculate/src/features/authentication/controller/bottom_bar_controller.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomBarController());
    bool isDark = Get.isDarkMode;
    return PopScope(
      canPop: true,
      onPopInvoked : (didPop){
        SystemNavigator.pop();
      },
      child: Obx(
        ()=> Scaffold(
          body: controller.selectedWidget[controller.selectedIndex.value],
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(Get.width*0.03),
            height: Get.height*0.065,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDark? blackShadeColor:blackColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: ()=>controller.onItemTapped(0),
                    child: Icon(CupertinoIcons.home,color:controller.selectedIndex.value==0? primaryColor:whiteColor,size: controller.selectedIndex.value==0?30:35,)),
                InkWell(
                  onTap: ()=>controller.onItemTapped(1),
                    child: Icon(Icons.history_outlined,color:controller.selectedIndex.value==1? primaryColor:whiteColor,size: controller.selectedIndex.value==1?30:40,)),
                InkWell(
                  onTap: ()=>controller.onItemTapped(2),
                    child: Icon(CupertinoIcons.profile_circled,color:controller.selectedIndex.value==2? primaryColor:whiteColor,size: controller.selectedIndex.value==2?30:40,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
