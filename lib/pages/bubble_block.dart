import 'package:flutter/material.dart';
import 'package:widgettest/model/bubble_chart_data.dart';
import 'package:widgettest/pages/bubble_chart.dart';
import 'package:widgettest/utils/constants.dart';

class MyBubbleBlock extends StatefulWidget {
  const MyBubbleBlock({super.key});

  @override
  State<MyBubbleBlock> createState() => _MyBubbleBlockState();
}

class _MyBubbleBlockState extends State<MyBubbleBlock> {
  List<BubbbleChartData> getChartData() {
  return [
    BubbbleChartData(2041),
    BubbbleChartData(1991),
    BubbbleChartData(681),
    BubbbleChartData(445),
    BubbbleChartData(21),
  ];
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bubble Block"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: veriticalPadding),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey.shade200,
                  height: MediaQuery.of(context).size.width,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const BubbleChartExample(),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}