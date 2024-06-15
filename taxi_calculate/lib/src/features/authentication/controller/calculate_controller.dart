import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalculateController extends GetxController {
  static CalculateController get instance => Get.find();
  String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  TextEditingController shiftTotal = TextEditingController();
  TextEditingController paidTotal = TextEditingController();
  TextEditingController tool = TextEditingController();
  TextEditingController careemBooking1Number = TextEditingController();
  TextEditingController careemBooking1Value = TextEditingController(text: '7');
  TextEditingController careemBooking2Number = TextEditingController();
  TextEditingController careemBooking2Value = TextEditingController(text: '5');
  TextEditingController airportTripNumber = TextEditingController();
  TextEditingController airportTripValue = TextEditingController(text: '15');
  TextEditingController normalTripNumber = TextEditingController();
  TextEditingController normalTripValue = TextEditingController(text: '2.5');
  TextEditingController hiredKmNumber = TextEditingController();
  TextEditingController hiredKmValue = TextEditingController(text: '0.59');
  TextEditingController extraNumber = TextEditingController();
  TextEditingController extraValue = TextEditingController(text: '2');
  TextEditingController credit = TextEditingController();
  TextEditingController cash = TextEditingController();
  TextEditingController careemPaid = TextEditingController();
  TextEditingController vacantKm = TextEditingController();
  TextEditingController customerTips = TextEditingController();
  TextEditingController halaPeak = TextEditingController();
  TextEditingController yourPercentage = TextEditingController();

  double bookingTrip =0;
  double airportTrip=0;
  double normalTrip=0;
  double hiredKm=0;
  double careem = 0;
  double extra = 0;
  double inTotal=0;
  double totalCleanMoney=0;
  double netCleanMoney = 0;

  void netCleanMoneyCalculate(double cleanMoney, String perc){
    netCleanMoney = cleanMoney* ((double.parse(perc))/100);
  }

  double cleanMoneyCalculate(
      String shiftTotal,
      String paidTotal,
      String tool,
      String careemBook2Number,
      String careenBook2Value,
      String airportTripNumber,
      String airportTripValue,
      String normalTripNumber,
      String normalTripValue,
      String hiredKmNumber,
      String hiredKmValue,
      String careemBook1Number,
      String careemBook1Value,
      String extraNumber,
      String extraValue,
      ) {
    inTotal = double.parse(shiftTotal)+double.parse(paidTotal);
    careem = double.parse(careemBook1Number) * double.parse(careemBook1Value);
    bookingTrip =
        (double.parse(careemBook2Number)) * double.parse(careenBook2Value);
    airportTrip =
        (double.parse(airportTripNumber)) * double.parse(airportTripValue);
    normalTrip =
        (double.parse(normalTripNumber)) * double.parse(normalTripValue);
    hiredKm = (double.parse(hiredKmNumber)) * double.parse(hiredKmValue);
    extra = (double.parse(extraNumber)) * double.parse(extraValue);
    totalCleanMoney = inTotal -
        (double.parse(tool) +
            bookingTrip +
            airportTrip +
            normalTrip +
            hiredKm +
            careem+extra);
    return totalCleanMoney;
  }
}
