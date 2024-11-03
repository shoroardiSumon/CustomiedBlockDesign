import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgettest/controller/tooltip_provider_two.dart';

class TootipTwoScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  TootipTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            HomeScreen(_scrollController),
            TooltipOverlay(_scrollController),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ScrollController _scrollController;
  final List<GlobalKey> _keys = List.generate(3, (index) => GlobalKey());

  HomeScreen(this._scrollController, {super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TooltipProviderTwo>(context, listen: false).setKeys(_keys);
    });

    return ListView(
      controller: _scrollController,
      children: [
        Container(key: _keys[0], height: 100, color: Colors.red),
        Container(key: _keys[1], height: 100, color: Colors.green),
        Container(key: _keys[2], height: 100, color: Colors.blue),
      ],
    );
  }
}

class TooltipOverlay extends StatelessWidget {
  final ScrollController _scrollController;

  const TooltipOverlay(this._scrollController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TooltipProviderTwo>(
      builder: (context, provider, child) {
        _scrollController.animateTo(
          _scrollController.position.pixels +
              (provider.currentKey.currentContext?.findRenderObject()?.getTransformTo(null)?.getTranslation().y ?? 0),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      
        return provider.currentKey != null
            ? Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    top: provider.currentKey.currentContext?.findRenderObject()?.getTransformTo(null)?.getTranslation().y ?? 0,
                    left: provider.currentKey.currentContext?.findRenderObject()?.getTransformTo(null)?.getTranslation().x ?? 0,
                    child: const TooltipWidget(),
                  ),
                ],
              )
            : Container();
      },
    );
  }
}

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Some instruction showing here'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Provider.of<TooltipProviderTwo>(context, listen: false).skip(),
                child: const Text('Skip'),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Provider.of<TooltipProviderTwo>(context, listen: false).previous(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () => Provider.of<TooltipProviderTwo>(context, listen: false).next(),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Provider.of<TooltipProviderTwo>(context, listen: false).skip(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}