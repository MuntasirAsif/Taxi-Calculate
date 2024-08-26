import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taxi_calculate/src/features/authentication/controller/calculate_controller.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
class CalculateScreenDate extends StatefulWidget {
  const CalculateScreenDate({
    super.key,
  });

  @override
  State<CalculateScreenDate> createState() => _CalculateScreenDateState();
}

class _CalculateScreenDateState extends State<CalculateScreenDate> {
  final dateController = Get.put(CalculateController());
  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(date,style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
        InkWell(
          onTap: () {
            _showDatePickerDialog(context);
          },
          child: Container(
              width: 130,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: isDark?whiteColor:blackColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(dateController.formattedDate),
                  Image.asset(calender,height: 20,)
                ],
              ))),
        ),
      ],
    );
  }

  void _showDatePickerDialog(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDayOfMonth,
      lastDate: now,
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          dateController.formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
        });
      }
    });
  }
}