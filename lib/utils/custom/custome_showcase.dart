// Custom content widget with buttons for each showcase item
import 'package:flutter/material.dart';

class CustomShowcaseContent extends StatelessWidget {
  final String description;
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final VoidCallback onCancel;
  final VoidCallback onSkip;
  final bool isShowBottom;

  const CustomShowcaseContent({
    super.key,
    required this.description,
    required this.onNext,
    this.onPrevious,
    required this.onCancel,
    required this.onSkip,
    required this.isShowBottom
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isShowBottom? 8 : 24),
          topRight: const Radius.circular(24),
          bottomLeft: Radius.circular(isShowBottom? 24 : 8),
          bottomRight: const Radius.circular(24),
        ),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            description,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (onPrevious != null)
                TextButton(
                  onPressed: onPrevious,
                  child: const Text("Previous", style: TextStyle(color: Colors.black)),
                ),
              TextButton(
                onPressed: onSkip,
                child: const Text("Skip", style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: onNext,
                child: const Text("Next", style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: onCancel,
                child: const Text("Cancel", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}