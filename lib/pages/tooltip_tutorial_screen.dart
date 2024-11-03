import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgettest/controller/tootip_provider.dart';
import 'package:widgettest/utils/custom/custom_tooltip.dart';

class TooltipTutorialScreen extends StatefulWidget {
  const TooltipTutorialScreen({super.key});

  @override
  State<TooltipTutorialScreen> createState() => _TooltipTutorialScreenState();
}

class _TooltipTutorialScreenState extends State<TooltipTutorialScreen> {
  OverlayEntry? overlayEntry;
  final ScrollController _scrollController = ScrollController();

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
    super.initState();
    initializeTooltip();
  }

//   @override
// void initState() {
//   super.initState();
//   initializeTooltip();
  
//   _scrollController.addListener(() {
//     if (overlayEntry != null) {
//       updateTooltipPosition();
//     }
//   });
// }

  // @override
  // void dispose() {
  //   _scrollController.removeListener(updateTooltipPosition);
  //   super.dispose();
  // }

  Future<void> initializeTooltip() async {
    final provider = Provider.of<TooltipProvider>(context, listen: false);
    provider.clearWidgets();
    provider.registerWidget(widgetKey1);
    provider.registerWidget(widgetKey2);
    provider.registerWidget(widgetKey3);

    provider.registerWidget(widgetKey4);
    provider.registerWidget(widgetKey5);
    provider.registerWidget(widgetKey6);

    provider.registerWidget(widgetKey7);
    provider.registerWidget(widgetKey8);
    provider.registerWidget(widgetKey9);

    // Check if the tooltip has been shown before
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasShownTooltip = prefs.getBool('hasShownTooltip') ?? false;

    if (!hasShownTooltip) {
      // Show the tooltip if it's the user's first time
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showTooltip();
      });
      // Set the flag to true so tooltip will not be shown again
      await prefs.setBool('hasShownTooltip', true);
    }
  }

//   void showTooltip() {
//   if (overlayEntry != null) {
//     overlayEntry!.remove();
//     overlayEntry = null;
//   }

//   updateTooltipPosition();
// }

// void updateTooltipPosition() {
//   final provider = Provider.of<TooltipProvider>(context, listen: false);
  
//   if (provider.currentIndex < provider.widgetKeys.length) {
//     final RenderBox renderBox = provider.widgetKeys[provider.currentIndex]
//         .currentContext!
//         .findRenderObject() as RenderBox;
//     final Offset position = renderBox.localToGlobal(Offset.zero);
//     final Size size = renderBox.size;
//     final screenHeight = MediaQuery.of(context).size.height;

//     final bool shouldShowAbove = position.dy + size.height + 132 > screenHeight;
//     final double tooltipPositionY = shouldShowAbove
//         ? position.dy - 132 // Appear above the widget
//         : position.dy + size.height; // Appear below the widget

//     overlayEntry?.markNeedsBuild(); // Redraw the overlay to update position

//     overlayEntry = OverlayEntry(
//       builder: (context) => Stack(
//         children: [
//           Positioned.fill(
//             child: GestureDetector(
//               onPanUpdate: (details) {
//                 _scrollController.jumpTo(
//                   _scrollController.position.pixels - details.delta.dy,
//                 );
//               },
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
//                 child: Container(
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: position.dx,
//             top: tooltipPositionY,
//             child: CustomTooltip(
//               text: "Some instruction showing here...",
//               onSkip: () {
//                 provider.skipTooltip();
//                 overlayEntry?.remove();
//                 overlayEntry = null;
//               },
//               onPrevious: () {
//                 provider.previousTooltip();
//                 showTooltip();
//               },
//               onNext: () {
//                 provider.nextTooltip();
//                 showTooltip();
//               },
//               onClose: () {
//                 overlayEntry?.remove();
//                 overlayEntry = null;
//               },
//               isFirst: provider.isFirstTooltip,
//               isLast: provider.isLastTooltip,
//             ),
//           ),
//         ],
//       ),
//     );
    
//     Overlay.of(context).insert(overlayEntry!);
//   }
// }


  void showTooltip() {
  final provider = Provider.of<TooltipProvider>(context, listen: false);

  if (overlayEntry != null) {
    overlayEntry!.remove();
    overlayEntry = null;
  }

  if (provider.currentIndex < provider.widgetKeys.length) {
    final RenderBox renderBox = provider.widgetKeys[provider.currentIndex]
        .currentContext!
        .findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    final screenHeight = MediaQuery.of(context).size.height;
    final bool shouldShowAbove = position.dy + size.height + 132 > screenHeight;

    final double tooltipPositionY = shouldShowAbove
        ? position.dy - 132 // Appear above the widget
        : position.dy + size.height; // Appear below the widget

    // Auto-scroll if the tooltip is out of view
    if (!shouldShowAbove &&
        (tooltipPositionY + 132 > _scrollController.position.pixels + screenHeight)) {
      _scrollController.animateTo(
        tooltipPositionY + 132 - screenHeight, // Scroll to bring tooltip fully in view
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Blurred background layer with scrollable capability
          Positioned.fill(
            child: GestureDetector(
              onPanUpdate: (details) {
                _scrollController.jumpTo(
                  _scrollController.position.pixels - details.delta.dy,
                );
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          ),

          // Tooltip layer
          Positioned(
            left: position.dx,
            top: tooltipPositionY,
            child: CustomTooltip(
              text: "Some instruction showing here...",
              onSkip: () {
                provider.skipTooltip();
                overlayEntry?.remove();
                overlayEntry = null;
              },
              onPrevious: () {
                provider.previousTooltip();
                showTooltip();
              },
              onNext: () {
                provider.nextTooltip();
                showTooltip();
              },
              onClose: () {
                overlayEntry?.remove();
                overlayEntry = null;
              },
              isFirst: provider.isFirstTooltip,
              isLast: provider.isLastTooltip,
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }
}


//   void showTooltip() {
//   final provider = Provider.of<TooltipProvider>(context, listen: false);

//   if (overlayEntry != null) {
//     overlayEntry!.remove();
//     overlayEntry = null;
//   }

//   if (provider.currentIndex < provider.widgetKeys.length) {
//     final RenderBox renderBox = provider.widgetKeys[provider.currentIndex]
//         .currentContext!
//         .findRenderObject() as RenderBox;
//     final Offset position = renderBox.localToGlobal(Offset.zero);
//     final Size size = renderBox.size;

//     // Ensure the tooltip and widget are fully visible on the screen
//     final screenHeight = MediaQuery.of(context).size.height;
//     final bool shouldShowAbove = position.dy + size.height + 132 > screenHeight;

//     // Calculate the tooltip's y-position based on whether it should appear above or below
//     final double tooltipPositionY = shouldShowAbove
//         ? position.dy - 132 // Appear above the widget
//         : position.dy + size.height; // Appear below the widget

//     overlayEntry = OverlayEntry(
//       builder: (context) => Stack(
//         children: [
//           // Blurred background layer
//           // Positioned.fill(
//           //   child: BackdropFilter(
//           //     filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
//           //     child: Container(
//           //       color: Colors.black.withOpacity(0.3), // Optional dim effect
//           //     ),
//           //   ),
//           // ),

//           // Tooltip layer
//           Positioned(
//             left: position.dx,
//             top: tooltipPositionY,
//             child: CustomTooltip(
//               text: "Some instruction showing here...",
//               onSkip: () {
//                 provider.skipTooltip();
//                 overlayEntry?.remove();
//                 overlayEntry = null;
//               },
//               onPrevious: () {
//                 provider.previousTooltip();
//                 showTooltip();
//               },
//               onNext: () {
//                 provider.nextTooltip();
//                 showTooltip();
//               },
//               onClose: () {
//                 overlayEntry?.remove();
//                 overlayEntry = null;
//               },
//               isFirst: provider.isFirstTooltip,
//               isLast: provider.isLastTooltip,
//             ),
//           ),
//         ],
//       ),
//     );

//     Overlay.of(context).insert(overlayEntry!);
//   }
// }



  // void showTooltip() {
  //   final provider = Provider.of<TooltipProvider>(context, listen: false);

  //   if (overlayEntry != null) {
  //     overlayEntry!.remove();
  //     overlayEntry = null;
  //   }

  //   if (provider.currentIndex < provider.widgetKeys.length) {
  //     final RenderBox renderBox = provider.widgetKeys[provider.currentIndex]
  //         .currentContext!
  //         .findRenderObject() as RenderBox;
  //     final Offset position = renderBox.localToGlobal(Offset.zero);
  //     final Size size = renderBox.size;

  //     // Scroll to make the target widget visible
  //     _scrollController.animateTo(
  //       position.dy,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );

  //     overlayEntry = OverlayEntry(
  //       builder: (context) => Container(
  //         height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  //         alignment: Alignment.center,
  //         child: Stack(
  //           children: [
  //             // Full-screen blurred background
  //             // Positioned.fill(
  //             //   child: BackdropFilter(
  //             //     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
  //             //     child: Container(color: Colors.black.withOpacity(0.3)),
  //             //   ),
  //             // ),
  //             Positioned(
  //               left: position.dx,
  //               top: position.dy + size.height + 10,
  //               child: CustomTooltip(
  //                 text: "Some instruction showing here...",
  //                 onSkip: () {
  //                   provider.skipTooltip();
  //                   overlayEntry?.remove();
  //                   overlayEntry = null;
  //                 },
  //                 onPrevious: () {
  //                   provider.previousTooltip();
  //                   showTooltip();
  //                 },
  //                 onNext: () {
  //                   provider.nextTooltip();
  //                   showTooltip();
  //                 },
  //                 onClose: () {
  //                   overlayEntry?.remove();
  //                   overlayEntry = null;
  //                 },
  //                 isFirst: provider.isFirstTooltip,
  //                 isLast: provider.isLastTooltip,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  //     Overlay.of(context).insert(overlayEntry!);
  //   }
  // }

  // void showTooltip() {
  //   final provider = Provider.of<TooltipProvider>(context, listen: false);

  //   // Check if there's already an overlay entry to remove
  //   if (overlayEntry != null) {
  //     overlayEntry!.remove();
  //     overlayEntry = null; // Set to null after removal to avoid future calls on it
  //   }

  //   if (provider.currentIndex < provider.widgetKeys.length) {
  //     final RenderBox renderBox = provider.widgetKeys[provider.currentIndex]
  //         .currentContext!
  //         .findRenderObject() as RenderBox;
  //     final Offset position = renderBox.localToGlobal(Offset.zero);
  //     final Size size = renderBox.size;

  //     overlayEntry = OverlayEntry(
  //       builder: (context) => Container(
  //         height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  //         alignment: Alignment.center,
  //         child: Stack(
  //           children: [
  //             // Blurred background layer
  //             Positioned.fill(
  //               child: BackdropFilter(
  //                 filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
  //                 child: Container(
  //                   //color: Colors.black.withOpacity(0.1), // Adjust opacity for dim effect
  //                   color: Colors.transparent, // Adjust opacity for dim effect
  //                 ),
  //               ),
  //             ),

  //             // Clear area for the highlighted widget
  //             // Positioned(
  //             //   left: position.dx,
  //             //   top: position.dy,
  //             //   child: BackdropFilter(
  //             //     filter: ImageFilter.blur(sigmaX: -1.0, sigmaY: -1.0),
  //             //     child: Container(
  //             //       width: size.width,
  //             //       height: size.height,
  //             //       color: Colors.transparent,
  //             //     ),
  //             //   ),
  //             // ),

  //             // Tooltip layer
  //             Positioned(
  //               left: position.dx,
  //               top: position.dy + size.height + 10,
  //               child: CustomTooltip(
  //                 text: "Some instruction showing here...",
  //                 onSkip: () {
  //                   provider.skipTooltip();
  //                   overlayEntry?.remove(); // This is safe now
  //                   overlayEntry = null; // Resetting for future use
  //                 },
  //                 onPrevious: () {
  //                   provider.previousTooltip();
  //                   showTooltip();
  //                 },
  //                 onNext: () {
  //                   provider.nextTooltip();
  //                   showTooltip();
  //                 },
  //                 onClose: () {
  //                   overlayEntry?.remove(); // This is safe now
  //                   overlayEntry = null; // Resetting for future use
  //                 },
  //                 isFirst: provider.isFirstTooltip,
  //                 isLast: provider.isLastTooltip,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  //     Overlay.of(context).insert(overlayEntry!);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tooltip Tutorial")),
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
                builder: (context, provider, child) {
                  // Only show tooltip when the current index is updated
                  if (provider.currentIndex < provider.widgetKeys.length) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showTooltip();
                    });
                  }

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