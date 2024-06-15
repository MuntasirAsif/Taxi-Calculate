import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxi_calculate/src/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:taxi_calculate/src/features/authentication/controller/history_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/text_strings.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
                Text(earningHistory,
                    style: textTheme.headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Calculation")
                      .snapshots(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        var months =
                            snapshot.data?.docs.map((doc) => doc.id).toList();
                        return SizedBox(
                          height: Get.height , // Constrain the height of the ListView
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              int reversedIndex = snapshot.data!.docs.length - 1 - index;
                              String month = months![reversedIndex];
                              return Column(
                                children: [
                                  MonthHistoryWidget(month: month),
                                  const SizedBox(height: 10,)
                                ],
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error.toString()}'),
                        );
                      } else {
                        return const Center(
                          child: Text('No data Found'),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MonthHistoryWidget extends StatefulWidget {
  final String month;
  const MonthHistoryWidget({
    super.key,
    required this.month,
  });

  @override
  State<MonthHistoryWidget> createState() => _MonthHistoryWidgetState();
}

class _MonthHistoryWidgetState extends State<MonthHistoryWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Container(
        height: expanded ? Get.height * 0.6 : Get.height * 0.1,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: cardBgColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.month.substring(5),
                  style: textTheme.titleLarge,
                ),
                expanded
                    ? const Icon(Icons.keyboard_arrow_up)
                    : const Icon(Icons.keyboard_arrow_down)
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            expanded
                ? InteractiveViewer(
                    panEnabled: true,
                    boundaryMargin:
                        EdgeInsets.symmetric(horizontal: defaultPadding),
                    minScale: 0.5,
                    maxScale: 100,
                    child: MonthData(
                      month: widget.month,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class MonthData extends StatefulWidget {
  final String month;
  const MonthData({
    super.key,
    required this.month,
  });

  @override
  State<MonthData> createState() => _MonthDataState();
}

class _MonthDataState extends State<MonthData> {
  final User? user = FirebaseAuth.instance.currentUser;
  final totalController = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    setState(() {
      totalController;
    });
    final textTheme = Theme.of(context).textTheme;
    String uid = user!.uid;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Calculation")
          .doc(widget.month)
          .collection('month')
          .doc(uid)
          .collection('date')
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: Get.height * 0.5, // Constrain the height of the ListView
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      totalController.totalCleanMoney = 0.0; // Reset the total before processing new data

                      var docs = snapshot.data?.docs;

                      if (docs == null || docs.isEmpty) {
                        return const Center(child: Text('No data found'));
                      }

                      // Extract data and transpose it
                      List<Map<String, dynamic>> dataList = [];

                      for (var doc in docs) {
                        Map<String, dynamic> data = doc.data();
                        dataList.add(data);
                        double netCleanMoney = double.tryParse(data['clean money']?.toString() ?? '') ?? 0.0;
                        totalController.totalCleanMoney += netCleanMoney; // Sum the net clean money
                      }

                      // Get all unique keys (fields)
                      Set<String> allKeys = {};
                      for (var data in dataList) {
                        allKeys.addAll(data.keys);
                      }

                      // Create columns for all unique fields
                      List<DataColumn> columns = [const DataColumn(label: Text('Date'))];
                      for (String key in allKeys) {
                        columns.add(DataColumn(label: Text(key)));
                      }

                      // Create rows for each date with field values
                      List<DataRow> rows = [];
                      Map<String, double> columnTotals = { for (var key in allKeys) key: 0.0 };

                      for (var doc in docs) {
                        Map<String, dynamic> data = doc.data();
                        List<DataCell> cells = [DataCell(Text(doc.id))];
                        for (String key in allKeys) {
                          double value = double.tryParse(data[key]?.toString() ?? '') ?? 0.0;
                          columnTotals[key] = (columnTotals[key] ?? 0.0) + value;
                          cells.add(DataCell(Text(data[key]?.toString() ?? '')));
                        }
                        rows.add(DataRow(cells: cells));
                      }

                      // Add total row
                      List<DataCell> totalCells = [const DataCell(Text('Total'))];
                      for (String key in allKeys) {
                        totalCells.add(DataCell(Text(columnTotals[key]?.toStringAsFixed(2) ?? '0')));
                      }
                      rows.add(DataRow(cells: totalCells));

                      if(totalController.totalCleanMoney>=90.0 && totalController.totalCleanMoney<=140.0){
                        totalController.perc=5;
                      }else if(totalController.totalCleanMoney>=140.01 && totalController.totalCleanMoney<=190.0){
                        totalController.perc=10;
                      }else if(totalController.totalCleanMoney>=190.01 && totalController.totalCleanMoney<=240.0){
                        totalController.perc=15;
                      }else if(totalController.totalCleanMoney>=240.01 && totalController.totalCleanMoney<=290.0){
                        totalController.perc=20;
                      }else if(totalController.totalCleanMoney>=290.01 && totalController.totalCleanMoney<=340.0){
                        totalController.perc=25;
                      }else if(totalController.totalCleanMoney>=340.01 && totalController.totalCleanMoney<=390.0){
                        totalController.perc=30;
                      }else if(totalController.totalCleanMoney>=390.01 && totalController.totalCleanMoney<=500.0){
                        totalController.perc=35;
                      }else if(totalController.totalCleanMoney>=500.01 && totalController.totalCleanMoney<=580.0){
                        totalController.perc=36;
                      }else if(totalController.totalCleanMoney>=580.01 && totalController.totalCleanMoney<=2000.0){
                        totalController.perc=37;
                      }
                        totalController.totalNetCleanMoney = (totalController.totalCleanMoney*totalController.perc)/100.0;
                      return Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: columns,
                              rows: rows,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(thickness: 5,),
                              Text(
                                'Clean Money :     ${totalController.totalCleanMoney.toStringAsFixed(2)}',
                                style: textTheme.titleLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Percentage :        ${totalController.perc} %',
                                style: textTheme.titleLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const Divider(),
                              Text(
                                'Your Money :      ${totalController.totalNetCleanMoney.toStringAsFixed(2)}',
                                style: textTheme.titleLarge!.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),// Space between table and total
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error.toString()}'),
            );
          } else {
            return const Center(
              child: Text('No data Found'),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
