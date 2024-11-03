import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgettest/controller/tooltip_provider_three.dart';

class CustomTooltip extends StatelessWidget {
  final GlobalKey targetKey;
  final int tooltipIndex;
  final String title;
  final String description;

  const CustomTooltip({
    super.key,
    required this.targetKey,
    required this.tooltipIndex,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final RenderBox renderBox = targetKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final bool isBottom = offset.dy > MediaQuery.of(context).size.height / 2;

    return Stack(
      children: [
        // Blurred background
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
        ),
        Positioned(
          top: isBottom ? null : offset.dy + renderBox.size.height,
          bottom: isBottom ? MediaQuery.of(context).size.height - offset.dy : null,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(description),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (tooltipIndex > 0)
                      TextButton(
                        onPressed: () => context.read<TooltipProviderThree>().previousTooltip(),
                        child: const Text("Previous"),
                      ),
                    TextButton(
                      onPressed: () => context.read<TooltipProviderThree>().skipTooltip(),
                      child: const Text("Skip"),
                    ),
                    TextButton(
                      onPressed: () => context.read<TooltipProviderThree>().cancelTooltip(),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => context.read<TooltipProviderThree>().nextTooltip(),
                      child: const Text("Next"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
