// Custom content widget with buttons for each showcase item
import 'package:flutter/material.dart';

class CustomShowcaseContent extends StatelessWidget {
  final String description;
  final VoidCallback onNext;
  final VoidCallback? onPrevious;
  final VoidCallback onCancel;
  final VoidCallback onSkip;

  const CustomShowcaseContent({
    super.key,
    required this.description,
    required this.onNext,
    this.onPrevious,
    required this.onCancel,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
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