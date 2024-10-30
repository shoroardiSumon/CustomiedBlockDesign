import 'package:flutter/material.dart';

class TooltipProvider extends ChangeNotifier {
  List<GlobalKey> widgetKeys = [];
  int currentIndex = 0;

  void registerWidget(GlobalKey key) {
    if (!widgetKeys.contains(key)) {
      widgetKeys.add(key);
    }
  }

  void clearWidgets() {
    widgetKeys.clear();
    currentIndex = 0;
  }

  void nextTooltip() {
    if (currentIndex < widgetKeys.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }

  void previousTooltip() {
    if (currentIndex > 0) {
      currentIndex--;
      notifyListeners();
    }
  }

  void _removeTooltip() {
    if (currentIndex < widgetKeys.length) {
      currentIndex++;
      notifyListeners();
    }
  }

  void skipTooltip() {
    currentIndex = widgetKeys.length; // Skips to the end
    _removeTooltip();
    notifyListeners();
  }

  bool get isLastTooltip => currentIndex >= widgetKeys.length - 1;
  bool get isFirstTooltip => currentIndex <= 0;
}