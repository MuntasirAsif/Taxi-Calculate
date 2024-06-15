import 'package:cloud_firestore/cloud_firestore.dart';

class CalculateModel {
  final String? id;
  final String shiftTotal;
  final String paidTotal;
  final String inTotal;
  final String normalTrip;
  final String careemBook1;
  final String careemBook2;
  final String airportTrip;
  final String tools;
  final String hiredKm;
  final String credit;
  final String cash;
  final String careemPaid;
  final String vacantKm;
  final String customerTips;
  final String halaPeak;
  final String cleanMoney;
  final String netCleanMoney;
  final String date;
  final String extra;

  const CalculateModel({
    this.id,
    required this.cash,
    required this.shiftTotal,
    required this.paidTotal,
    required this.inTotal,
    required this.normalTrip,
    required this.careemBook1,
    required this.careemBook2,
    required this.airportTrip,
    required this.tools,
    required this.hiredKm,
    required this.credit,
    required this.careemPaid,
    required this.vacantKm,
    required this.customerTips,
    required this.halaPeak,
    required this.cleanMoney,
    required this.netCleanMoney,
    required this.date,
    required this.extra,
  });

  toJson() {
    return {
      "shift total": shiftTotal,
      "paid total": paidTotal,
      "in total": inTotal,
      "normal trip": normalTrip,
      "careem book1": careemBook1,
      "careem book2": careemBook2,
      "airportTrip": airportTrip,
      "tools": tools,
      "hired KM": hiredKm,
      "credit": credit,
      "cash": cash,
      "careem paid": careemPaid,
      "vacant KM": vacantKm,
      "customer tips": customerTips,
      "hala peak": halaPeak,
      "clean money": cleanMoney,
      "net clean money": netCleanMoney,
      "extra": extra,
    };
  }

  factory CalculateModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CalculateModel(
      id: doc.id,
      shiftTotal: data['shift total'] ?? '',
      tools: data['tools'] ?? '',
      airportTrip: data['airportTrip'] ?? '',
      netCleanMoney: data['net clean money'] ?? '',
      normalTrip: data['normal trip'] ?? '',
      careemBook1: data['careem book'] ?? '',
      careemPaid: data['careem paid'] ?? '',
      halaPeak: data['hala peak'] ?? '',
      hiredKm: data['hired KM'] ?? '',
      credit: data['credit'] ?? '',
      vacantKm: data['vacant KM'] ?? '',
      customerTips: data['customer tips'] ?? '',
      cleanMoney: data['clean money'] ?? '',
      date: data['date'] ?? '',
      paidTotal: data['paid total'] ?? '',
      inTotal: data['in total'] ?? '',
      careemBook2: data['careem book2'] ?? '',
      extra: data['extra'] ?? '',
      cash: data['cash'] ?? '',
    );
  }
}
