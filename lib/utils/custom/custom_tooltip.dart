import 'package:flutter/material.dart';

class CustomTooltip extends StatelessWidget {
  final String text;
  final VoidCallback onSkip;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onClose;
  final bool isFirst;
  final bool isLast;

  const CustomTooltip({super.key, 
    required this.text,
    required this.onSkip,
    required this.onPrevious,
    required this.onNext,
    required this.onClose,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 361,
        height: 132,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: onSkip,
                  child: const Text("Skip"),
                ),
                if (!isFirst)
                  IconButton(
                    onPressed: onPrevious,
                    icon: const Icon(Icons.arrow_back),
                  ),
                if (!isLast)
                  IconButton(
                    onPressed: onNext,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}