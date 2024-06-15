import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: Get.height * 0.2,
        ),
        Text(
          title,
          style: textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}