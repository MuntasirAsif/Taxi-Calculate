import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/image_strings.dart';
class HomeImage extends StatelessWidget {
  const HomeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.2,
      width: double.infinity,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(homeImage),fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}