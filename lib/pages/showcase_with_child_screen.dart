import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:widgettest/controller/tootip_provider.dart';
import 'package:widgettest/utils/custom/custome_showcase.dart';

class ShowcaseScrrenWithChild extends StatefulWidget {
  const ShowcaseScrrenWithChild({super.key});

  @override
  State<ShowcaseScrrenWithChild> createState() => _ShowcaseScrrenWithChildState();
}

class _ShowcaseScrrenWithChildState extends State<ShowcaseScrrenWithChild> {
  final GlobalKey key1 = GlobalKey();
  final GlobalKey key2 = GlobalKey();
  final GlobalKey key3 = GlobalKey();

  final GlobalKey key4 = GlobalKey();
  final GlobalKey key5 = GlobalKey();
  final GlobalKey key6 = GlobalKey();

  final GlobalKey key7 = GlobalKey();
  final GlobalKey key8 = GlobalKey();
  final GlobalKey key9 = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ShowCaseWidget.of(context).startShowCase([
        key1,
        key2,
        key3,
        key4,
        key5,
        key6,
        key7,
        key8,
        key9,
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Showcase Tootip 2.0")),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Consumer<TooltipProvider>(
            builder: (context, provider, child) {
              // Only show tooltip when the current index is updated
              if (provider.currentIndex < provider.widgetKeys.length) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  //showTooltip();
                });
              }
          
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Showcase.withWidget(
                    key: key1,
                    height: 80,
                    width: 140,
                    overlayColor: Colors.blue,
                    
                    container: Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomShowcaseContent(
                        description: "Widget 111111",
                        onNext: () {
                          print("Next");
                        },
                        onCancel: () {
                          print("Cancel");
                        },
                        onSkip: () {
                          print("Skip");
                        },  
                        onPrevious: () {
                          print("Previous");
                        },
                      )
                    ),
                    
                    onTargetClick: () {
                      print("Widget 1");
                    },

                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Widget 1"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  Showcase.withWidget(
                    key: key2,
                    height: 80,
                    width: 140,
                    overlayColor: Colors.blue,
                    tooltipPosition: TooltipPosition.bottom,
                    scrollLoadingWidget: const CircularProgressIndicator(),
                    
                    container: Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomShowcaseContent(
                        description: "Widget 222222",
                        onNext: () {
                          print("Next");
                        },
                        onCancel: () {
                          print("Cancel");
                        },
                        onSkip: () {
                          print("Skip");
                        },  
                        onPrevious: () {
                          print("Previous");
                        },
                      )
                    ),
                    
                    onTargetClick: () {
                      print("Widget 2");
                    },

                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Widget 2"),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Showcase.withWidget(
                    key: key3,
                    height: 80,
                    width: 140,
                    overlayColor: Colors.blue,
                    
                    container: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Widget 333333"),
                    ),
                    
                    onTargetClick: () {
                      print("Widget 3");
                    },

                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Widget 3"),
                    ),
                  ),
          
                  const SizedBox(height: 20),
                  Showcase.withWidget(
                    key: key4,
                    height: 80,
                    width: 140,
                    overlayColor: Colors.blue,
                    
                    container: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Widget 444444"),
                    ),
                    
                    onTargetClick: () {
                      print("Widget 4");
                    },

                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Widget 4"),
                    ),
                  ),
          
                  const SizedBox(height: 20),
                  Showcase.withWidget(
                    key: key5,
                    height: 80,
                    width: 140,
                    overlayColor: Colors.blue,
                    
                    container: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Widget 555555"),
                    ),
                    
                    onTargetClick: () {
                      print("Widget 5");
                    },

                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Widget 5"),
                    ),
                  ),
          
                  const SizedBox(height: 20),
                  Showcase.withWidget(
                    key: key6,
                    height: 80,
                    width: 140,
                    overlayColor: Colors.blue,
                    
                    container: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Widget 666666"),
                    ),
                    
                    onTargetClick: () {
                      print("Widget 6");
                    },

                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Widget 6"),
                    ),
                  ),
          
                  const SizedBox(height: 20),
                  Showcase.withWidget(
                    key: key7,
                    height: 80,
                    width: 140,
                    overlayColor: Colors.blue,
                    
                    container: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Widget 777777"),
                    ),
                    
                    onTargetClick: () {
                      print("Widget 7");
                    },

                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Widget 7"),
                    ),
                  ),
          
                  const SizedBox(height: 20),
                  Showcase.withWidget(
                    key: key8,
                    height: 80,
                    width: 140,
                    overlayColor: Colors.blue,
                    
                    container: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Widget 888888"),
                    ),
                    
                    onTargetClick: () {
                      print("Widget 8");
                    },

                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Widget 8"),
                    ),
                  ),
          
                  const SizedBox(height: 20),
                  Showcase.withWidget(
                    key: key9,
                    height: 80,
                    width: 140,
                    overlayColor: Colors.blue,
                    
                    container: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Widget 999999"),
                    ),
                    
                    onTargetClick: () {
                      print("Widget 9");
                    },

                    child: Container(
                      height: 120,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Widget 9"),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}