import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
class ForgetPasswordButtonWidget extends StatelessWidget {
  const ForgetPasswordButtonWidget({
    super.key,
    required this.buttonIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final IconData buttonIcon;
  final String title, subTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(defaultPadding * 0.25),
        height: Get.height * 0.1,
        decoration: BoxDecoration(
            color: isDark? blackShadeColor : cardBgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all()),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    buttonIcon,
                    size: 50,
                  ),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textTheme.titleLarge,
                      ),
                      Text(
                        subTitle,
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(CupertinoIcons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}