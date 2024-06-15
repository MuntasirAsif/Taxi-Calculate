import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/model/calculate_model.dart';
import 'package:taxi_calculate/src/repository/calculate_repository/calculate_repository.dart';
import '../../../../../common_widgets/button_widget/button_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'additional_calculate_widgets/clean_money.dart';

class AdditionalCalculate extends StatefulWidget {
  final controller;
  const AdditionalCalculate({super.key, required this.controller});

  @override
  State<AdditionalCalculate> createState() => _AdditionalCalculateState();
}

class _AdditionalCalculateState extends State<AdditionalCalculate> {
  bool save = false;
  final formKey = GlobalKey<FormState>();
  final calculationRep = Get.put(CalculateRepository());

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
                Text(additionalInfo,
                    style: textTheme.headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                CleanMoney(textTheme: textTheme, controller: widget.controller),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(credit,
                          style: textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: widget.controller.credit,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: 'Enter Amount'),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(cash,
                          style: textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: widget.controller.cash,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: 'Enter Amount'),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(careemPaid,
                          style: textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: widget.controller.careemPaid,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: 'Enter Amount'),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(vacantKm,
                          style: textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: widget.controller.vacantKm,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: 'Enter Amount'),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(customerTips,
                          style: textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: widget.controller.customerTips,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: 'Enter Amount'),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(halaPeak,
                          style: textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: widget.controller.halaPeak,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter amount';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: 'Enter Amount'),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Row(
                        children: [
                          Text(yourPercentage,
                              style: textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: Get.width * 0.025,
                          ),
                          SizedBox(
                            width: Get.width * 0.2,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: widget.controller.yourPercentage,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter amount';
                                }
                                return null;
                              },
                              decoration:
                                  const InputDecoration(hintText: 'Percentage'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        setState(() {
                                          widget.controller
                                              .netCleanMoneyCalculate(
                                                  widget.controller
                                                      .totalCleanMoney,
                                                  widget.controller
                                                      .yourPercentage.text
                                                      .trim());
                                          save = true;
                                        });
                                      }
                                    },
                                    child: const ButtonWidget(
                                        height: 50,
                                        width: 160,
                                        buttonName: 'Calculate',
                                        buttonNameFontSize: 20)),
                                Container(
                                  height: 80,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: cardBgColor,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          yourMoney,
                                          style: textTheme.titleLarge,
                                        ),
                                        Text(
                                          widget.controller.netCleanMoney
                                              .toStringAsFixed(2),
                                          style: textTheme.titleMedium,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            save
                                ? InkWell(
                                    onTap: () {
                                      final calculation = CalculateModel(
                                        shiftTotal: widget
                                            .controller.shiftTotal.text
                                            .trim(),
                                        paidTotal: widget
                                            .controller.paidTotal.text
                                            .trim(),
                                        inTotal: widget
                                            .controller.inTotal.toString(),
                                        normalTrip: widget.controller.normalTrip
                                            .toString(),
                                        careemBook1:
                                            widget.controller.careem.toString(),
                                          careemBook2:  widget.controller.bookingTrip.toString(),
                                        airportTrip: widget
                                            .controller.airportTrip
                                            .toString(),
                                        tools:
                                            widget.controller.tool.text.trim(),
                                        hiredKm: widget.controller.hiredKm
                                            .toString(),
                                        credit: widget.controller.credit.text
                                            .trim(),
                                        careemPaid: widget
                                            .controller.careemPaid.text
                                            .trim(),
                                        vacantKm: widget
                                            .controller.vacantKm.text
                                            .trim(),
                                        customerTips: widget
                                            .controller.customerTips.text
                                            .trim(),
                                        halaPeak: widget
                                            .controller.halaPeak.text
                                            .trim(),
                                        cleanMoney: widget
                                            .controller.totalCleanMoney
                                            .toString(),
                                        netCleanMoney: widget
                                            .controller.netCleanMoney
                                            .toString(), date: widget.controller.formattedDate,
                                        extra: widget
                                            .controller.extra
                                            .toString(),
                                        cash: widget.controller.cash.text
                                          .trim(),

                                      );
                                      calculationRep
                                          .uploadCalculate(calculation);
                                    },
                                    child: const ButtonWidget(
                                        height: 50,
                                        width: 120,
                                        buttonName: 'Save',
                                        buttonNameFontSize: 20),
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
