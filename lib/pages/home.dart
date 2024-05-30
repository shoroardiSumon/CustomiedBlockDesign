import 'package:flutter/material.dart';
import 'package:widgettest/pages/bg_screen.dart';
import 'package:widgettest/pages/dashboard.dart';
import 'package:widgettest/utils/app_navigator.dart';
import 'package:widgettest/utils/constants.dart';
import 'package:widgettest/utils/custom/multi_radial_gradient_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: MultiRadialGradientPainter(
              bgColor: const Color(0xFF1E0A3C),
              gradientColor: Color.fromARGB(255, 33, 16, 122),
            ),
            child: Container(),
          ),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: veriticalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const Dashboard(), const Offset(1, 0), 500));
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),
      
                const SizedBox(height: 20,),
      
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const IndigoBackground(), const Offset(1, 0), 500));
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Background", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}