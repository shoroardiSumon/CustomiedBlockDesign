import 'package:flutter/material.dart';

class TooltipTarget extends StatelessWidget {
  final GlobalKey targetKey;
  final int tooltipIndex;
  final String title;
  final String description;

  const TooltipTarget({
    super.key,
    required this.targetKey,
    required this.tooltipIndex,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      key: targetKey,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.primaries[tooltipIndex % Colors.primaries.length],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "Widget $tooltipIndex",
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
