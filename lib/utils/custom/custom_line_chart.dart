import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widgettest/model/line_chart_data.dart';

class CustomLineChart extends StatelessWidget {
  final List<LineChartData> data;
  final String price;
  final String percentageChange;
  final bool isPositiveChange;

  const CustomLineChart({
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
              isVisible: true,
              axisLine: AxisLine(width: 0),
              majorTickLines: MajorTickLines(width: 0),
              labelStyle: TextStyle(color: Colors.grey),
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              isVisible: true,
              axisLine: AxisLine(width: 0),
              majorTickLines: MajorTickLines(width: 0),
              majorGridLines: MajorGridLines(width: 0),
              labelStyle: TextStyle(color: Colors.grey),
              interval: 25,  // Customize the interval as needed
              minimum: 0,    // Set the minimum value of the Y-axis
              maximum: 200,  // Set the maximum value of the Y-axis
            ),
            series: <CartesianSeries<LineChartData, DateTime>>[
              SplineAreaSeries<LineChartData, DateTime>(
                dataSource: data,
                xValueMapper: (LineChartData sales, _) => sales.time,
                yValueMapper: (LineChartData sales, _) => sales.value,
                borderColor: Colors.pinkAccent,
                borderWidth: 3,
                gradient: LinearGradient(
                  colors: [
                    Colors.pinkAccent.withOpacity(0.4),
                    Colors.pinkAccent.withOpacity(0.01),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                splineType: SplineType.natural,
                markerSettings: const MarkerSettings(
                  isVisible: true,
                  color: Colors.white,
                  borderWidth: 4,
                  borderColor: Colors.pinkAccent,
                  shape: DataMarkerType.circle,
                ),
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(color: Colors.white),
                  labelPosition: ChartDataLabelPosition.outside,
                  useSeriesColor: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:widgettest/model/line_chart_data.dart';

// class CustomLineChart extends StatelessWidget {
//   final List<LineChartData> data;
//   final String price;
//   final String percentageChange;
//   final bool isPositiveChange;

//   const CustomLineChart({
//     super.key,
//     required this.data,
//     required this.price,
//     required this.percentageChange,
//     required this.isPositiveChange,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '\$$price',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             isPositiveChange ? '+$percentageChange ↑' : '$percentageChange ↓',
//             style: TextStyle(
//               color: isPositiveChange ? Colors.greenAccent : Colors.redAccent,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 16),
//           SfCartesianChart(
//             plotAreaBorderWidth: 0,
//             primaryXAxis: const DateTimeAxis(
//               axisLine: AxisLine(width: 0),
//               majorTickLines: MajorTickLines(width: 0),
//               labelStyle: TextStyle(color: Colors.grey),
//             ),
//             primaryYAxis: const NumericAxis(
//               isVisible: false,
//             ),
//             series: <CartesianSeries<LineChartData, DateTime>>[
//               SplineAreaSeries<LineChartData, DateTime>(
//                 dataSource: data,
//                 xValueMapper: (LineChartData sales, _) => sales.time,
//                 yValueMapper: (LineChartData sales, _) => sales.value,
//                 borderColor: Colors.pinkAccent,
//                 borderWidth: 3,
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.pinkAccent.withOpacity(0.4),
//                     Colors.pinkAccent.withOpacity(0.01),
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 splineType: SplineType.natural,
//                 markerSettings: const MarkerSettings(
//                   isVisible: true,
//                   color: Colors.white,
//                   borderWidth: 3,
//                   borderColor: Colors.pinkAccent,
//                   shape: DataMarkerType.circle,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }












// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:widgettest/model/line_chart_data.dart';

// class CustomLineChart extends StatelessWidget {
//   final List<BubbleChartData> data;
//   final String price;
//   final String percentageChange;
//   final bool isPositiveChange;

//   const CustomLineChart({
//     super.key,
//     required this.data,
//     required this.price,
//     required this.percentageChange,
//     required this.isPositiveChange,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '\$$price',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             isPositiveChange ? '+$percentageChange ↑' : '$percentageChange ↓',
//             style: TextStyle(
//               color: isPositiveChange ? Colors.greenAccent : Colors.redAccent,
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 16),
//           SfCartesianChart(
//             plotAreaBorderWidth: 0,
//             primaryXAxis: const DateTimeAxis(
//               axisLine: AxisLine(width: 0),
//               majorTickLines: MajorTickLines(width: 0),
//               labelStyle: TextStyle(color: Colors.grey),
//             ),
//             primaryYAxis: const NumericAxis(
//               isVisible: false,
//             ),
//             series: <CartesianSeries<BubbleChartData, DateTime>>[
//               LineSeries<BubbleChartData, DateTime>(
//                 dataSource: data,
//                 xValueMapper: (BubbleChartData sales, _) => sales.time,
//                 yValueMapper: (BubbleChartData sales, _) => sales.value,
//                 color: Colors.pinkAccent,
//                 width: 3,
//                 markerSettings: const MarkerSettings(
//                   isVisible: true,
//                   color: Colors.white,
//                   borderWidth: 3,
//                   borderColor: Colors.pinkAccent,
//                   shape: DataMarkerType.circle,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


