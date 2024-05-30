import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredCircle extends StatefulWidget {
  const BlurredCircle({super.key});

  @override
  State<BlurredCircle> createState() => _BlurredCircleState();
}

class _BlurredCircleState extends State<BlurredCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.3),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.0), // Invisible container to apply the blur effect
        ),
      ),
    );
  }
}