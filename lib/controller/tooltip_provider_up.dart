import 'package:flutter/material.dart';

class TooltipProviderUp with ChangeNotifier {
  int currentTargetIndex = 0;
  List<GlobalKey> targetKeys = [];

  void setTargetKeys(List<GlobalKey> keys) {
    targetKeys = keys;
    notifyListeners();
  }

  void nextTarget() {
    if (currentTargetIndex < targetKeys.length - 1) {
      currentTargetIndex++;
      notifyListeners();
    }
  }

  void previousTarget() {
    if (currentTargetIndex > 0) {
      currentTargetIndex--;
      notifyListeners();
    }
  }

  void skip() {
    currentTargetIndex = targetKeys.length; // Exit the tooltip
    notifyListeners();
  }

  void cancel() {
    currentTargetIndex = -1; // Hide the tooltip
    notifyListeners();
  }
}