
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgettest/controller/tooltip_provider_three.dart';
import 'package:widgettest/utils/custom/custom_tooltip.dart';
import 'package:widgettest/utils/custom/target_tooltip.dart';

class TooltipExampleScreen extends StatefulWidget {
  const TooltipExampleScreen({super.key});

  @override
  State<TooltipExampleScreen> createState() => _TooltipExampleScreenState();
}

class _TooltipExampleScreenState extends State<TooltipExampleScreen> {
  final GlobalKey widgetKey1 = GlobalKey();
  final GlobalKey widgetKey2 = GlobalKey();
  final GlobalKey widgetKey3 = GlobalKey();
  final GlobalKey widgetKey4 = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTarget(GlobalKey targetKey) {
    final RenderBox? renderBox = targetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final offset = renderBox.localToGlobal(Offset.zero);
      final targetPosition = offset.dy - MediaQuery.of(context).size.height / 4;

      _scrollController.animateTo(
        targetPosition,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tooltip Example"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => TooltipProviderThree(),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TooltipTarget(
                      targetKey: widgetKey1,
                      tooltipIndex: 0,
                      title: "Title 1",
                      description: "This is the first tooltip description.",
                    ),
                    const SizedBox(height: 20),
                    TooltipTarget(
                      targetKey: widgetKey2,
                      tooltipIndex: 1,
                      title: "Title 2",
                      description: "This is the second tooltip description.",
                    ),
                    const SizedBox(height: 20),
                    TooltipTarget(
                      targetKey: widgetKey3,
                      tooltipIndex: 2,
                      title: "Title 3",
                      description: "This is the third tooltip description.",
                    ),
                    const SizedBox(height: 20),
                    TooltipTarget(
                      targetKey: widgetKey4,
                      tooltipIndex: 3,
                      title: "Title 4",
                      description: "This is the fourth tooltip description.",
                    ),
                  ],
                ),
              ),
            ),
            Consumer<TooltipProviderThree>(
              builder: (context, provider, child) {
                if (provider.isTooltipVisible) {
                  final targetKey = [
                    widgetKey1,
                    widgetKey2,
                    widgetKey3,
                    widgetKey4
                  ][provider.currentTooltipIndex];

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollToTarget(targetKey);
                  });

                  return CustomTooltip(
                    text: "Next tttttt", 
                    onSkip: () {  }, onPrevious: () {  }, onNext: () {  }, onClose: () {  },
                    
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
