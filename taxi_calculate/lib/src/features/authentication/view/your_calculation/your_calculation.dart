import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/constants/sizes.dart';

class YourCalculation extends StatelessWidget {
  const YourCalculation({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding*2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text('Calculation',
                  style: textTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Divider(thickness: 2,),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('   Money     ', style: textTheme.titleMedium),
                        Text('Percentage', style: textTheme.titleMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('90 --- 140 ', style: textTheme.titleMedium),
                        Text('5%', style: textTheme.titleMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('140 --- 190  ', style: textTheme.titleMedium),
                        Text('10%', style: textTheme.titleMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('190 --- 240  ', style: textTheme.titleMedium),
                        Text('15%', style: textTheme.titleMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('240 --- 290 ', style: textTheme.titleMedium),
                        Text('20%', style: textTheme.titleMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('290 --- 340 ', style: textTheme.titleMedium),
                        Text('25%', style: textTheme.titleMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('340 --- 390 ', style: textTheme.titleMedium),
                        Text('30%', style: textTheme.titleMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('390 --- 500 ', style: textTheme.titleMedium),
                        Text('35%', style: textTheme.titleMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('500 --- 580 ', style: textTheme.titleMedium),
                        Text('36%', style: textTheme.titleMedium),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('580 --- 2000 ', style: textTheme.titleMedium),
                        Text('37%', style: textTheme.titleMedium),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
