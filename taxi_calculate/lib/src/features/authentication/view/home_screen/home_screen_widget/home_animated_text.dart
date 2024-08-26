import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';

class HomeAnimatedText extends StatelessWidget {
  const HomeAnimatedText({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: Get.height * 0.15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.headlineLarge!.copyWith(fontSize: 40),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                titleNLine,
                style: textTheme.headlineLarge!.copyWith(fontSize: 40),
              ),
              SizedBox(
                width: 300,
                height: 100.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: primaryColor,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          RotateAnimatedText(subtitle1,
                              alignment: Alignment.centerLeft),
                          RotateAnimatedText(subtitle2,
                              alignment: Alignment.centerLeft),
                          RotateAnimatedText(subtitle3,
                              alignment: Alignment.centerLeft),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
