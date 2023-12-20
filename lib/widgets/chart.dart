import 'package:finance_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
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
              SalesData('Mon', 100),
              SalesData("Tue", 78),
              SalesData("wed", 22),
              SalesData("sat", 56),
              SalesData("Fri", 23),
              SalesData("sun", 50)
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
  final String year;
  final int sales;

  SalesData(this.year, this.sales);
}
