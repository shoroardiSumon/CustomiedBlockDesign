import 'package:flutter/material.dart';
import 'package:widgettest/model/line_chart_data.dart';
import 'package:widgettest/utils/custom/custom_bar_chart.dart';
import 'package:widgettest/utils/custom/custom_line_chart.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({super.key});

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  bool isLinegraph = true;
  void toggleGraph(){
    setState(() {
      isLinegraph = !isLinegraph;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text("My Line Chart", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              isLinegraph?
              CustomLineChart(
                price: '34,567.89',
                percentageChange: '5.12%',
                isPositiveChange: false,
                data: [
                  LineChartData(DateTime(2024, 8, 12, 0, 0), 50),
                  LineChartData(DateTime(2024, 8, 12, 3, 0), 100),
                  LineChartData(DateTime(2024, 8, 12, 6, 0), 70),
                  LineChartData(DateTime(2024, 8, 12, 9, 0), 140),
                  LineChartData(DateTime(2024, 8, 12, 12, 0), 120),
                  LineChartData(DateTime(2024, 8, 12, 15, 0), 190),
                  LineChartData(DateTime(2024, 8, 12, 18, 0), 150),
                  LineChartData(DateTime(2024, 8, 12, 23, 0), 110),
                ],
              )
              : CustomBarChart(
                price: '34,567.89',
                percentageChange: '5.12%',
                isPositiveChange: false,
                data: [
                  LineChartData(DateTime(2024, 8, 12, 0, 0), 50),
                  LineChartData(DateTime(2024, 8, 12, 3, 0), 100),
                  LineChartData(DateTime(2024, 8, 12, 6, 0), 70),
                  LineChartData(DateTime(2024, 8, 12, 9, 0), 140),
                  LineChartData(DateTime(2024, 8, 12, 12, 0), 120),
                  LineChartData(DateTime(2024, 8, 12, 15, 0), 190),
                  LineChartData(DateTime(2024, 8, 12, 18, 0), 150),
                  LineChartData(DateTime(2024, 8, 12, 23, 0), 110),
                ],
              ),



              InkWell(
                  onTap: () {
                    toggleGraph();
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Switch", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}