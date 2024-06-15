import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/image_strings.dart';
class TimeSection extends StatelessWidget {
  TimeSection({
    super.key,
  });
  String text = '';
  String icon = '';
  @override
  Widget build(BuildContext context) {
    text = getGreeting();
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
              height: Get.height*0.05,
              child: Image(image: AssetImage(icon))),
          Text(text),
        ],
      ),
    );
  }
  String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      icon = weatherIcon;
      return 'Good Morning';
    } else if (hour >= 12 && hour < 15) {
      icon = noonWeatherIcon;
      return 'Good Noon';
    } else if (hour >= 15 && hour < 18) {
      icon = afterNoonWeatherIcon;
      return 'Good Afternoon';
    } else if (hour >= 18 && hour < 20) {
      icon = eveningWeatherIcon;
      return 'Good Evening';
    } else {
      icon = nightWeatherIcon;
      return 'Good Night';
    }
  }
}