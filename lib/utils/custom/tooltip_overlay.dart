import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgettest/controller/tooltip_provider_up.dart';
import 'package:widgettest/utils/custom/custom_tooltip.dart';

class TooltipOverlay extends StatelessWidget {
  final ScrollController scrollController;

  const TooltipOverlay({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TooltipProviderUp>(context);
    final targetIndex = provider.currentTargetIndex;

    if (targetIndex < 0 || targetIndex >= provider.targetKeys.length) {
      return const SizedBox.shrink(); // Hide overlay if no target
    }

    // Get the target position
    final RenderBox targetBox = provider.targetKeys[targetIndex].currentContext!.findRenderObject() as RenderBox;
    final targetOffset = targetBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Determine if tooltip should be above or below the widget
    final bool showAbove = (targetOffset.dy + targetBox.size.height + 100 > screenHeight);
    final tooltipPosition = showAbove
        ? targetOffset.dy - 140
        : targetOffset.dy + targetBox.size.height + 8;

    // Scroll to target position
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        targetOffset.dy - screenHeight / 3,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    return Stack(
      children: [
        // Blur background
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),
        ),

        // Tooltip positioned above or below the target
        Positioned(
          top: tooltipPosition,
          left: 16,
          right: 16,
          child: CustomTooltip(
            text: 'Tooltip $targetIndex',
            onSkip: provider.skip,
            onPrevious: provider.previousTarget,
            onNext: provider.nextTarget,
            onClose: provider.cancel,
            isFirst: targetIndex == 0,
            isLast: targetIndex == provider.targetKeys.length - 1,
          ),
        ),
      ],
    );
  }
}