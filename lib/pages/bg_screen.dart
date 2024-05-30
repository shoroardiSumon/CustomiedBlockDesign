import 'package:flutter/material.dart';
import 'package:widgettest/utils/custom/blurred_circle.dart';

class IndigoBackground extends StatefulWidget {
  const IndigoBackground({super.key});

  @override
  State<IndigoBackground> createState() => _IndigoBackgroundState();
}

class _IndigoBackgroundState extends State<IndigoBackground> {
  @override
  Widget build(BuildContext context) {
    double ht = MediaQuery.of(context).size.height;
    double wt = MediaQuery.of(context).size.width;

    return Container(
      color: const Color.fromARGB(255, 45, 5, 56),
      child: Stack(
        children: [
          Positioned(
            top: ht * 0.2,
            left: wt * 0.2,
            child: BlurredCircle(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.35,
            child: BlurredCircle(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: MediaQuery.of(context).size.width * 0.7,
            child: BlurredCircle(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.8,
            left: MediaQuery.of(context).size.width * 0.4,
            child: BlurredCircle(),
          ),
        ],
      ),
    );
  }
}