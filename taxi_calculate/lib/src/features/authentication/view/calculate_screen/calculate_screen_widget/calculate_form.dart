import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:taxi_calculate/src/features/authentication/controller/calculate_controller.dart';
import '../../../../../common_widgets/button_widget/button_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';
import 'package:get/get.dart';

import '../additional_calculate/additional_calculate.dart';

class CalculateForm extends StatefulWidget {
  const CalculateForm({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  State<CalculateForm> createState() => _CalculateFormState();
}

class _CalculateFormState extends State<CalculateForm> {
  double totalCleanMoney = 0;
  bool next = false;
  final formKey = GlobalKey<FormState>();
  bool isInterstitialLoaded = false;
  late InterstitialAd interstitialAd;

  adLoaded()async{
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3605548896631296/5749689851',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad){
              setState(() {
                interstitialAd= ad;
                isInterstitialLoaded =true;
              });
            },
            onAdFailedToLoad: (error){
              print(error);
              interstitialAd.dispose();
              isInterstitialLoaded=false;
            }));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adLoaded();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.isDarkMode;
    final controller = Get.put(CalculateController());
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(shiftTotal,
                        style: widget.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.shiftTotal,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter amount';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Enter Amount'),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text('',
                      style: widget.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const Text('+'),
                ],
              ),
              SizedBox(
                width: Get.width * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(paidTotal,
                        style: widget.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.paidTotal,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter amount';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Enter Amount'),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text('',
                      style: widget.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  const Text('='),
                ],
              ),
              SizedBox(
                width: Get.width * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(inTotal,
                        style: widget.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Container(
                        height: 47,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: isDark ? whiteColor : blackColor)),
                        child: Center(
                            child:
                                Text(controller.inTotal.toStringAsFixed(2)))),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(tool,
              style: widget.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: controller.tool,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter amount';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: 'Enter Amount'),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(careemBook1,
              style: widget.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.careemBooking1Number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Careem 1'),
                ),
              ),
              const Text('X'),
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.careemBooking1Value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(),
                ),
              ),
              const Text('='),
              Container(
                  width: Get.width * 0.25,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: isDark ? whiteColor : blackColor)),
                  child: Center(
                      child: Text(controller.careem.toStringAsFixed(2)))),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(careemBook2,
              style: widget.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.careemBooking2Number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Careem 2'),
                ),
              ),
              const Text('X'),
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.careemBooking2Value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  //initialValue: '5',
                  decoration: const InputDecoration(hintText: 'Amount'),
                ),
              ),
              const Text('='),
              Container(
                  width: Get.width * 0.25,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: isDark ? whiteColor : blackColor)),
                  child: Center(
                      child: Text(controller.bookingTrip.toStringAsFixed(2)))),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(airportTrip,
              style: widget.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.airportTripNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Number'),
                ),
              ),
              const Text('X'),
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.airportTripValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  //initialValue: '14',
                  decoration: const InputDecoration(hintText: 'Amount'),
                ),
              ),
              const Text('='),
              Container(
                  width: Get.width * 0.25,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: isDark ? whiteColor : blackColor)),
                  child: Center(
                      child: Text(controller.airportTrip.toStringAsFixed(2)))),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(normalTrip,
              style: widget.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.normalTripNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Number'),
                ),
              ),
              const Text('X'),
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.normalTripValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  //initialValue: '4',
                  decoration: const InputDecoration(hintText: 'Amount'),
                ),
              ),
              const Text('='),
              Container(
                  width: Get.width * 0.25,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: isDark ? whiteColor : blackColor)),
                  child: Center(
                      child: Text(controller.normalTrip.toStringAsFixed(2)))),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(hiredKm,
              style: widget.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.hiredKmNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Number'),
                ),
              ),
              const Text('X'),
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.hiredKmValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  //initialValue: '0.6',
                  decoration: const InputDecoration(hintText: 'Amount'),
                ),
              ),
              const Text('='),
              Container(
                  width: Get.width * 0.25,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: isDark ? whiteColor : blackColor)),
                  child: Center(
                      child: Text(controller.hiredKm.toStringAsFixed(2)))),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(extraOption,
              style: widget.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.extraNumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'Number'),
                ),
              ),
              const Text('X'),
              SizedBox(
                width: Get.width * 0.25,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.extraValue,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill';
                    }
                    return null;
                  },
                  //initialValue: '0.6',
                  decoration: const InputDecoration(hintText: 'Amount'),
                ),
              ),
              const Text('='),
              Container(
                  width: Get.width * 0.25,
                  height: 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: isDark ? whiteColor : blackColor)),
                  child: Center(
                      child: Text(controller.extra.toStringAsFixed(2)))),
            ],
          ),
          SizedBox(
            height: Get.height * 0.01,
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
                          if(isInterstitialLoaded==true){
                            interstitialAd.show();
                          }
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              totalCleanMoney = controller.cleanMoneyCalculate(
                                controller.shiftTotal.text.trim(),
                                controller.paidTotal.text.trim(),
                                controller.tool.text.trim(),
                                controller.careemBooking2Number.text.trim(),
                                controller.careemBooking2Value.text.trim(),
                                controller.airportTripNumber.text.trim(),
                                controller.airportTripValue.text.trim(),
                                controller.normalTripNumber.text.trim(),
                                controller.normalTripValue.text.trim(),
                                controller.hiredKmNumber.text.trim(),
                                controller.hiredKmValue.text.trim(),
                                controller.careemBooking1Number.text.trim(),
                                controller.careemBooking1Value.text.trim(),
                                controller.extraNumber.text.trim(),
                                controller.extraValue.text.trim(),
                              );
                              next = true;
                            });
                          }
                        },
                        child:  ButtonWidget(
                            height: 50,
                            width: Get.width*0.4,
                            buttonName: 'Calculate',
                            buttonNameFontSize: 20)),
                    Container(
                      height: 80,
                      width: Get.width*0.45,
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
                              style: widget.textTheme.titleLarge,
                            ),
                            Text(
                              totalCleanMoney.toStringAsFixed(2),
                              style: widget.textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                next
                    ? InkWell(
                        onTap: () {
                          Get.to(() => AdditionalCalculate(
                                controller: controller,
                              ));
                        },
                        child: const ButtonWidget(
                            height: 50,
                            width: 120,
                            buttonName: 'Next',
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
    );
  }
}
