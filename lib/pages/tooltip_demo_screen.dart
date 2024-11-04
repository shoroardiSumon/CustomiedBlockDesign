import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgettest/controller/tooltip_provider_up.dart';
import 'package:widgettest/utils/custom/tooltip_overlay.dart';

class TooltipDemoScreen extends StatefulWidget {

  const TooltipDemoScreen({super.key});

  @override
  State<TooltipDemoScreen> createState() => _TooltipDemoScreenState();
}

class _TooltipDemoScreenState extends State<TooltipDemoScreen> {
  final ScrollController scrollController = ScrollController();

  final GlobalKey key1 = GlobalKey();

  final GlobalKey key2 = GlobalKey();

  final GlobalKey key3 = GlobalKey();

  final GlobalKey key4 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TooltipProviderUp()..setTargetKeys([key1, key2, key3, key4]),
      child: Scaffold(
        body: Stack(
          children: [
            // Main scrollable content with individual widgets
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    key: key1,
                    margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                    height: 120,
                    color: Colors.redAccent,
                    child: const Center(child: Text("Target Widget 1", style: TextStyle(color: Colors.white))),
                  ),
                  Container(
                    key: key2,
                    margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                    height: 120,
                    color: Colors.green,
                    child: const Center(child: Text("Target Widget 2", style: TextStyle(color: Colors.white))),
                  ),
                  Container(
                    key: key3,
                    margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                    height: 120,
                    color: Colors.blue,
                    child: const Center(child: Text("Target Widget 3", style: TextStyle(color: Colors.white))),
                  ),
                  Container(
                    key: key4,
                    margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                    height: 120,
                    color: Colors.orange,
                    child: const Center(child: Text("Target Widget 4", style: TextStyle(color: Colors.white))),
                  ),
                ],
              ),
            ),

            // Tooltip overlay
            TooltipOverlay(scrollController: scrollController),
          ],
        ),
      ),
    );
  }
}