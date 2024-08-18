import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgettest/model/chart_data.dart';

class BubbleChartPainter extends CustomPainter {
  final List<ChartData> data;
  BubbleChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    final Random random = Random();
    final Set<Rect> bubbleRects = {};

    for (var point in data) {
      Color color = Colors.primaries[random.nextInt(Colors.primaries.length)];
      paint.color = color;

      double radius = point.size * 0.1;
      Offset offset;
      Rect rect;

      do {
        offset = Offset(random.nextDouble() * size.width, random.nextDouble() * size.height);
        rect = Rect.fromCircle(center: offset, radius: radius);
      } while (bubbleRects.any((r) => r.overlaps(rect)));

      bubbleRects.add(rect);
      canvas.drawCircle(offset, radius, paint);

      final textPainter = TextPainter(
        text: TextSpan(
          text: point.size.toString(),
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(minWidth: 0, maxWidth: size.width);
      final offsetText = Offset(
        offset.dx - textPainter.width / 2,
        offset.dy - textPainter.height / 2,
      );
      textPainter.paint(canvas, offsetText);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}