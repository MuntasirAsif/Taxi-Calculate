import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/text_strings.dart';
class CleanMoney extends StatelessWidget {
  const CleanMoney({
    super.key,
    required this.textTheme,
    required this.controller,
  });

  final TextTheme textTheme;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 200,
        decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                cleanMoney,
                style: textTheme.titleLarge,
              ),
              Text(controller.totalCleanMoney.toStringAsFixed(2),
                style: textTheme.titleMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}