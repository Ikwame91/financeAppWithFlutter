import 'package:finance_app/data/model/add_data.dart';
import 'package:finance_app/data/utility.dart';
import 'package:finance_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  final int index;
  const Chart({super.key, required this.index});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<AddData>? selectedData;
  bool isWeekly = true;
  bool isMonthly = true;
  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        selectedData = today();
        isWeekly = true;
        isMonthly = true;

        break;
      case 1:
        selectedData = week();
        isWeekly = false;
        isMonthly = true;

        break;
      case 2:
        selectedData = month();
        isWeekly = false;
        isMonthly = true;

        break;
      case 3:
        selectedData = year();

        isMonthly = true;

        break;
      default:
    }
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: AppColors.bgColor,
            width: 3,
            dataSource: <SalesData>[
              // SalesData('Mon', 100),
              // SalesData("Tue", 78),
              // SalesData("wed", 22),
              // SalesData("sat", 56),
              // SalesData("Fri", 23),
              // SalesData("sun", 50),
              ...List.generate(
                  time(selectedData!, isWeekly ? true : false).length, (index) {
                // Check if index is within the valid range
                if (index < selectedData!.length) {
                  return SalesData(
                    isMonthly
                        ? isWeekly
                            ? selectedData![index].dateTime.hour.toString()
                            : selectedData![index].dateTime.day.toString()
                        : selectedData![index].dateTime.month.toString(),
                    isWeekly
                        ? index > 0
                            ? time(selectedData!, true)[index] +
                                time(selectedData!, true)[index - 1]
                            : time(selectedData!, true)[index]
                        : index > 0
                            ? time(selectedData!, false)[index] +
                                time(selectedData!, false)[index - 1]
                            : time(selectedData!, false)[index],
                  );
                } else {
                  // Handle the case when index is out of range
                  return SalesData('', 0);
                }
              })
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
