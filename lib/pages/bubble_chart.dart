import 'dart:math';

import 'package:bubble_chart/bubble_chart.dart';
import 'package:flutter/material.dart';

class BubbleChartExample extends StatelessWidget {
  const BubbleChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BubbleChartLayout(
        children: getBubbleNodes(),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  List<BubbleNode> getBubbleNodes() {
    final Random random = Random();
    final List<int> data = [2041, 1991, 681, 445, 300, 250, 200, 150, 2000, 1000, 1500];
    return data.map((size) {
      return BubbleNode.leaf(
        value: size.toDouble(),
        options: BubbleOptions(
          color: Colors.primaries[random.nextInt(Colors.primaries.length)],
          child: Text(
            size.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }).toList();
  }
}