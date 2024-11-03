import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:widgettest/pages/bg_screen.dart';
import 'package:widgettest/pages/bubble_block.dart';
import 'package:widgettest/pages/coach_mark_screen.dart';
import 'package:widgettest/pages/dashboard.dart';
import 'package:widgettest/pages/my_line_chart.dart';
import 'package:widgettest/pages/showcase_tool_screen.dart';
import 'package:widgettest/pages/showcase_with_child_screen.dart';
import 'package:widgettest/pages/tooltip_example.dart';
import 'package:widgettest/pages/tooltip_tutorial_screen.dart';
import 'package:widgettest/pages/tooltip_two_screen.dart';
import 'package:widgettest/utils/app_navigator.dart';
import 'package:widgettest/utils/constants.dart';
import 'package:widgettest/utils/custom/custom_dialog.dart';
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
              gradientColor: const Color.fromARGB(255, 33, 16, 122),
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
                    Navigator.of(context).push(appNavigator(const CoachMarkScreen(), const Offset(1, 0), 500));
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Coach Mark Example", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),

                const SizedBox(height: 20,),

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const TooltipExampleScreen(), const Offset(1, 0), 500));
                    // Navigator.of(context).push(
                    //   CupertinoPageRoute(
                    //     builder: (context) => ShowCaseWidget(
                    //       builder: (context) => const ShowcaseScrrenWithChild(),
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Tooltip Example", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),

                const SizedBox(height: 20,),

                InkWell(
                  onTap: () {
                    //Navigator.of(context).push(appNavigator(const ShowCaseScreen(), const Offset(1, 0), 500));
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => ShowCaseWidget(
                          builder: (context) => const ShowcaseScrrenWithChild(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Tooltip Showcase 2.0", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),

                const SizedBox(height: 20,),

                InkWell(
                  onTap: () {
                    //Navigator.of(context).push(appNavigator(const ShowCaseScreen(), const Offset(1, 0), 500));
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => ShowCaseWidget(
                          builder: (context) => const ShowCaseScreen(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Tooltip Showcase", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),

                const SizedBox(height: 20,),

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(appNavigator(TootipTwoScreen(), const Offset(1, 0), 500));
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Tooltip Co-pilot", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),

                const SizedBox(height: 20,),

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const TooltipTutorialScreen(), const Offset(1, 0), 500));
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Tooltip", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),

                const SizedBox(height: 20,),

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const MyLineChart(), const Offset(1, 0), 500));
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Line Chart", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),

                const SizedBox(height: 20,),

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(appNavigator(const MyBubbleBlock(), const Offset(1, 0), 500));
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Bubble Block", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),

                const SizedBox(height: 20,),

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
                    child: const Text("Customized Block", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                  ),
                ),
      
                const SizedBox(height: 20,),
                  
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CustomDialogBox(
                          title: 'Dialog Title',
                          content: 'This is the content of the dialog. shssjs sjsjs sjsjs sjsjs sjsj sjsjs sjsn snsjs s jsnss  sjsns shsjs s sjhjs',
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black
                    ),
                    child: const Text("Dialog", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
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