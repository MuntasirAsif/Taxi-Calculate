import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.height,
    required this.width,
    required this.buttonName,
    required this.buttonNameFontSize,
  });
  final String buttonName;
  final double buttonNameFontSize;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: Get.width*0.05),
      decoration: BoxDecoration(
        border: Border.all(),
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            buttonName,
            style: textTheme.titleLarge!.copyWith(
                fontSize: buttonNameFontSize, fontWeight: FontWeight.bold),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
