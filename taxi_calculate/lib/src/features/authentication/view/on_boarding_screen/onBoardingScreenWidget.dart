import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/on_boarding_screen_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.model,
  });

  final OnBoardingScreenModel model;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(model.height*0.03),
      color: model.bgColor,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(image: AssetImage(model.image),height: model.height*0.5,),
          Column(
            children: [
              Text(model.title,style: textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),),
              Text(model.subtitle,style: textTheme.bodyMedium,textAlign: TextAlign.center),
            ],
          ),

          Text(model.pageCounter,style: textTheme.bodyLarge,),
          SizedBox(height: Get.height*0.05)
        ],
      ),);
  }
}
