import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/constants/sizes.dart';
import 'package:taxi_calculate/src/constants/text_strings.dart';
import 'calculate_screen_widget/calculate_form.dart';
import 'calculate_screen_widget/calculate_screen_date.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  calculate,style: textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold)
                ),
                SizedBox(height: Get.height*0.02,),
                const CalculateScreenDate(),
                CalculateForm(textTheme: textTheme)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

