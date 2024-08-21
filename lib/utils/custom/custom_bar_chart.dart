import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widgettest/model/line_chart_data.dart';

class CustomBarChart extends StatelessWidget {
  final List<LineChartData> data;
  final String price;
  final String percentageChange;
  final bool isPositiveChange;

  const CustomBarChart({
    super.key,
    required this.data,
    required this.price,
    required this.percentageChange,
    required this.isPositiveChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$$price',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            isPositiveChange ? '+$percentageChange ↑' : '$percentageChange ↓',
            style: TextStyle(
              color: isPositiveChange ? Colors.greenAccent : Colors.redAccent,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const DateTimeAxis(
              axisLine: AxisLine(width: 0),  // Hide the X axis line
              majorTickLines: MajorTickLines(width: 0),  // Hide the major tick lines on the X axis
              labelStyle: TextStyle(color: Colors.grey),  // Style for the X axis labels
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              axisLine: AxisLine(width: 0),  // Hide the Y axis line
              majorTickLines: MajorTickLines(width: 0),  // Hide the major tick lines on the Y axis
              labelStyle: TextStyle(color: Colors.grey),  // Style for the Y axis labels
              majorGridLines: MajorGridLines(width: 0),
              interval: 50,  // Customize the interval as needed
              minimum: 0,    // Set the minimum value of the Y-axis
              maximum: 200,  // Set the maximum value of the Y-axis
            ),
            series: <CartesianSeries<LineChartData, DateTime>>[
              ColumnSeries<LineChartData, DateTime>(
                dataSource: data,
                xValueMapper: (LineChartData sales, _) => sales.time,
                yValueMapper: (LineChartData sales, _) => sales.value,
                color: Colors.pinkAccent,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(color: Colors.white),
                  labelPosition: ChartDataLabelPosition.outside,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
