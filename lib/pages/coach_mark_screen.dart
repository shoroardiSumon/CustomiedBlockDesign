import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:widgettest/controller/tootip_provider.dart';
import 'package:widgettest/utils/custom/custome_showcase.dart';

class CoachMarkScreen extends StatefulWidget {
  const CoachMarkScreen({super.key});

  @override
  State<CoachMarkScreen> createState() => _CoachMarkScreenState();
}

class _CoachMarkScreenState extends State<CoachMarkScreen> {
  final ScrollController _scrollController = ScrollController();
  //coach mark properties
  TutorialCoachMark? tutorialCoachMark;
  List<TargetFocus> targets = [];

  final GlobalKey widgetKey1 = GlobalKey();
  final GlobalKey widgetKey2 = GlobalKey();
  final GlobalKey widgetKey3 = GlobalKey();
  final GlobalKey widgetKey4 = GlobalKey();
  final GlobalKey widgetKey5 = GlobalKey();
  final GlobalKey widgetKey6 = GlobalKey();
  final GlobalKey widgetKey7 = GlobalKey();
  final GlobalKey widgetKey8 = GlobalKey();
  final GlobalKey widgetKey9 = GlobalKey();

  @override
  void initState() {
    Future.delayed( const Duration(milliseconds: 400), () {
      showTutorial();
    });
    super.initState();
  }

  // void showTutorial(){
  //   initTarget();
  //   tutorialCoachMark = TutorialCoachMark(
  //     targets: targets,
  //     pulseEnable: false,
  //   )..show(context: context);	
  // }

  void showTutorial() {
    initTarget();
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      pulseEnable: false,
      onFinish: () => _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      ),
      onClickTarget: (target) => _scrollToTarget(target),
      onClickOverlay: (target) => _scrollToTarget(target),
      useSafeArea: true,
    )..show(context: context);
  }

  void _scrollToTarget(TargetFocus target) {
    // Get the position of the target widget
    final renderBox = target.keyTarget!.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy;

    // Calculate the scroll offset to bring the target to the center of the screen
    final screenHeight = MediaQuery.of(context).size.height;
    final targetCenterOffset = position - screenHeight / 2 + renderBox.size.height / 2;

    // Scroll the controller to the calculated offset
    _scrollController.animateTo(
      targetCenterOffset,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }


  // void _scrollToTarget(TargetFocus target) {
  //   final renderBox = target.keyTarget!.currentContext!.findRenderObject() as RenderBox;
  //   final position = renderBox.localToGlobal(Offset.zero).dy;

  //   // Calculate the offset to scroll the widget to the center of the screen
  //   final offset = position - (MediaQuery.of(context).size.height / 2) + (renderBox.size.height / 2);

  //   // Scroll to the calculated offset
  //   _scrollController.animateTo(
  //     offset,
  //     duration: const Duration(milliseconds: 400),
  //     curve: Curves.easeInOut,
  //   );
  // }

  // void _scrollToTarget(TargetFocus target) {
  //   final RenderBox renderBox = target.keyTarget!.currentContext!.findRenderObject() as RenderBox;
  //   final position = renderBox.localToGlobal(Offset.zero).dy;

  //   _scrollController.animateTo(
  //     position - (MediaQuery.of(context).size.height / 2),
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  void initTarget(){
    targets = [
      TargetFocus(
        identify: "widget-Key1",
        keyTarget: widgetKey1,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CustomShowcaseContent(
                description: "This is Widget 1", 
                onNext: () => controller.next(), 
                onCancel: () => controller.skip(), 
                onSkip: () => controller.skip(),
              );
            },
          )
        ],
      ),

      TargetFocus(
        identify: "widget-Key2",
        keyTarget: widgetKey2,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CustomShowcaseContent(
                description: "This is Widget 2", 
                onNext: () => controller.next(), 
                onCancel: () => controller.skip(), 
                onSkip: () => controller.skip(),
              );
            },
          )
        ],
      ),

      TargetFocus(
        identify: "widget-Key3",
        keyTarget: widgetKey3,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CustomShowcaseContent(
                description: "This is Widget 3", 
                onNext: () => controller.next(), 
                onCancel: () => controller.skip(), 
                onSkip: () => controller.skip(),
              );
            },
          )
        ],
      ),

      TargetFocus(
        identify: "widget-Key4",
        keyTarget: widgetKey4,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return CustomShowcaseContent(
                description: "This is Widget 4", 
                onNext: () => controller.next(), 
                onCancel: () => controller.skip(), 
                onSkip: () => controller.skip(),
              );
            },
          )
        ],
      ),

      TargetFocus(
        identify: "widget-Key5",
        keyTarget: widgetKey5,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CustomShowcaseContent(
                description: "This is Widget 5", 
                onNext: () => controller.next(), 
                onCancel: () => controller.skip(), 
                onSkip: () => controller.skip(),
              );
            },
          )
        ],
      ),

      TargetFocus(
        identify: "widget-Key6",
        keyTarget: widgetKey6,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CustomShowcaseContent(
                description: "This is Widget 6", 
                onNext: () => controller.next(), 
                onCancel: () => controller.skip(), 
                onSkip: () => controller.skip(),
              );
            },
          )
        ],
      ),

      TargetFocus(
        identify: "widget-Key7",
        keyTarget: widgetKey7,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CustomShowcaseContent(
                description: "This is Widget 7", 
                onNext: () => controller.next(), 
                onCancel: () => controller.skip(), 
                onSkip: () => controller.skip(),
              );
            },
          )
        ],
      ),

      TargetFocus(
        identify: "widget-Key8",
        keyTarget: widgetKey8,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CustomShowcaseContent(
                description: "This is Widget 8", 
                onNext: () => controller.next(), 
                onCancel: () => controller.skip(), 
                onSkip: () => controller.skip(),
              );
            },
          )
        ],
      ),

      TargetFocus(
        identify: "widget-Key9",
        keyTarget: widgetKey9,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return CustomShowcaseContent(
                description: "This is Widget 9", 
                onNext: () => controller.next(), 
                onCancel: () => controller.skip(), 
                onSkip: () => controller.skip(),
              );
            },
          )
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Coach Mark Tutorial")),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<TooltipProvider>(
                builder: (context, provider, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        key: widgetKey1,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Widget 1"),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: double.infinity,
                        key: widgetKey2,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Widget 2"),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: double.infinity,
                        key: widgetKey3,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Widget 3"),
                      ),

                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: double.infinity,
                        key: widgetKey4,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Widget 4"),
                      ),

                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: double.infinity,
                        key: widgetKey5,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Widget 5"),
                      ),

                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: double.infinity,
                        key: widgetKey6,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Widget 6"),
                      ),

                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: double.infinity,
                        key: widgetKey7,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Widget 7"),
                      ),

                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: double.infinity,
                        key: widgetKey8,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Widget 8"),
                      ),

                      const SizedBox(height: 20),
                      Container(
                        height: 120,
                        width: double.infinity,
                        key: widgetKey9,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text("Widget 9"),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}